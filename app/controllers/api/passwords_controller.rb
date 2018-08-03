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
      user= Spree::User.find_by!(email: params[:spree_user][:email])
      params.require(:spree_user).permit(:password)
      updated = user.update_attributes(:password => params[:spree_user][:password])
      sign_in :spree_user, user if user.errors.empty?
      render json: {status: "Password changed Successfully!"} if updated
    end
  end
end
