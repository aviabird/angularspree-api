# frozen_string_literal: true

class Api::PasswordsController < BaseController
  def create
    user = Spree::User.find_by!(email: params[:spree_user][:email])
    token = user.send(:set_reset_password_token)
    UserMailer.reset_password_instructions(user, token).deliver
    respond_with user
  end

  def update
    if params[:spree_user][:password].blank?
      user = Spree::User.new
      user.errors[:password] = 'Cannot be blank'
    else
      user = Spree::User.reset_password_by_token(params[:spree_user])
      sign_in :spree_user, user if user.errors.empty?
    end
    respond_with user
  end
end
