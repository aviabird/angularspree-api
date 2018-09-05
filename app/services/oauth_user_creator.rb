# frozen_string_literal: true

class OauthUserCreator
  attr_reader :info, :spree_current_user

  def initialize(user_info, spree_current_user)
    @info = user_info
    @current_user = spree_current_user
  end

  def call
    identity = Identity.find_or_initialize_by(uid: info.uid, provider: info.provider)
    identity.user.generate_spree_api_key! if identity.user&.spree_api_key?
    if identity.user.present?
      # The identity we found had a user associated with it
      return identity.user
    else
      # No user associated with the identity so we need to create a new one
      @user = find_or_create_user_from_oauth

      if @user.persisted?
        @order.update(user: @user) if @order && !@order.user
        @user.generate_spree_api_key! unless @user.spree_api_key?
        identity.user = @user
        identity.save!
        UserMailer.user_registration_instructions(@user).deliver
        return @user
      else
        return nil
      end
    end
  end

  private

  def find_or_create_user_from_oauth
    user = Spree::User.find_by(email: info.email)
    # check if user is present in db.
    if !user.present?
      user = Spree::User.create(email: info.email)
      if user.new_record?
        user.password = SecureRandom.hex
        user.save
        return user
      end
    else
      return user
    end
  end
end
