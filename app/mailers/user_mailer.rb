class UserMailer < ActionMailer::Base
  default from: ENV['MAIL_FROM']
  
  def reset_password_instructions(user, token)
    @user = user
    @token =token
    mail(to: @user.email, subject: ENV['RESET_PASSWORD_SUBJECT'])
  end
end