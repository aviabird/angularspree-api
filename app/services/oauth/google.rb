module Oauth
  class Google < Oauth::Base

    def fetch_user_info
      response = _client.get(user_info_url, access_token: @access_token)
      @user_info = Oauth::UserInfo::Google.new(JSON.parse(response.body))
    end

  private
    def access_token_url
      'https://www.googleapis.com/oauth2/v3/token'
    end

    def user_info_url
      'https://www.googleapis.com/plus/v1/people/me/openIdConnect'
    end

  end
end
