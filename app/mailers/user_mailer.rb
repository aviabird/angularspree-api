class UserMailer < ActionMailer::Base
  
  def reset_password_instructions(user, token)
    @user = user
    @token =token
    mail(to: @user.email, subject: 'Reset Password Instructions')
  end

  def user_registration_instructions(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to #{ENV['APP_NAME']}")
  end
end