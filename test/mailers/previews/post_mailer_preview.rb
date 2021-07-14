# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/post_mailer/post_created
  def post_created
    PostMailer.create_post

    if File.exists?('app/assets/images/test.png')
      PostMailer.post_created.deliver_now
    end
  end

end
