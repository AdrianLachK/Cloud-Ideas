class PostMailer < ApplicationMailer

  def post_created(user_email)
    attachments["word_cloud.png"] = File.read('app/assets/images/test.png')
    mail(
      from: user_email,
      to: "Printer_Mail",
      subject: "Printing word cloud"
    )
    File.delete('app/assets/images/test.png') if File.exist?('app/assets/images/test.png')
  end
end
