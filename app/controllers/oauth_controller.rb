# frozen_string_literal: true

class OauthController < BaseController
  def create
    auth = Oauth.for(params[:provider]).new(params).call

    if auth.authorized?
      user = OauthUserCreator.new(auth.user_info, set_current_user).call
      if user
        render json: user,
               root: false,
               scope: user,
               serializer: LiteUserSerializer
      else
        render json: { error: "Error linking #{params[:provider]} account" }
      end
    else
      render json: { error: "There was an error with #{params['provider']}. please try again." }, status: 422
    end
  end
end
