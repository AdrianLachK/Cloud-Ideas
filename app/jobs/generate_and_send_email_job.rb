class GenerateAndSendEmailJob < ApplicationJob
  queue_as :default
  def perform(*args)
    User.all.each do |user|
      user_quotes = Quote.all.where(user_id: user.id)
      if user_quotes.count > 2
        words = user_quotes.
          order(:score).
          limit(2).
          pluck(:label).
          map { |word| [word, rand(45)] }

        @quotes = user_quotes.
          order(:score).
          limit(2)
        cloud = MagicCloud::Cloud.new(words, rotate: :free, scale: :sqrt)
        img = cloud.draw(960, 600)
        img.write('app/assets/images/test.png')

        if File.exists?('app/assets/images/test.png')
          PostMailer.post_created(user.email).deliver_now

        end
      end
    end
  end
end