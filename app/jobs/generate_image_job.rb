class GenerateImageJob < ApplicationJob
  queue_as :default
  def perform(*args)
      words = Quote.
        all.
        order(:score).
        limit(7).
        pluck(:label).
        map { |word| [word, rand(45)] }
        @quotes = Quote.
        all.
        order(:score).
        limit(7)
      cloud = MagicCloud::Cloud.new(words, rotate: :free, scale: :sqrt)
      img = cloud.draw(960, 600)
      img.write('app/assets/images/test.png')
    end
end
