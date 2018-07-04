class UserMailer < ActionMailer::Base
  
  def reset_password_instructions(user, token)
    @user = user
    @token =token
    mail(to: @user.email, subject: 'Reset Password Instructions')
  end
end