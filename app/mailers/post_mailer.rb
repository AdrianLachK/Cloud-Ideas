class PostMailer < ApplicationMailer

  def create_post
    words = Quote.
      all.
      order(:score).
      limit(7).
      pluck(:label).
      map { |word| [word, rand(45)] }
    @quotes =   Quote.
      all.
      order(:score).
      limit(7)
    cloud = MagicCloud::Cloud.new(words, rotate: :free, scale: :sqrt)
    img = cloud.draw(960, 600)
    img.write('app/assets/images/test.png')
  end

  def post_created
    attachments["word_cloud.png"] = File.read('app/assets/images/test.png')
    mail(
      from: "Email_Holder",
      to: "Printer_Mail",
      subject: "Printing word cloud"
    )
  end
end
