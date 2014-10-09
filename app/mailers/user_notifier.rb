class UserNotifier < ActionMailer::Base

  default :from => 'mailer@getahead.com'

  def send_signup_email(user)
    @user = user
    mail(
      :to      => @user.email,
      :subject => 'Thanks for signing up for Get Ahead!' 
      )
  end

  def contact_program(to,from,subject,body)
    mail(to: to, from: from, subject: subject, body: body)
  end

end
