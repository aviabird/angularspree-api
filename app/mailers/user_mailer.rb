class UserMailer < ActionMailer::Base
  default from: 'angularspree@aviabird.com'
  
  def reset_password_instructions(user, token)
    @user = user
    @token =token
    mail(to: @user.email, subject: 'Angular Spree Reset password instructions')
  end
end