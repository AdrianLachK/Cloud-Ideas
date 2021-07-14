class GenerateAndSendEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)

    PostMailer.create_post

    if File.exists?('app/assets/images/test.png')
      PostMailer.post_created.deliver_now
    end
  end
end
