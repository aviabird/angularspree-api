module Oauth
  class Base
    attr_reader :user_info

    def initialize(params = {})
      fail MissingTokenError, 'Auth code is missing' if params[:oauthData][:code].blank?
      parse_params params
    end

    def call
      fetch_access_token && fetch_user_info
      self
    end

    def authorized?
      @access_token && user_info
    end

    private

    def parse_params(params)
      @params = {
          code:          URI.unescape(params[:oauthData][:code]),
          redirect_uri:  params[:authorizationData][:redirect_uri],
          client_id:     ENV['GOOGLE_CLIENT_ID'] ,
          client_secret: ENV['GOOGLE_CLIENT_SECRET'],
          grant_type:    'authorization_code'
      }
    end

    def fetch_access_token
      response = _client.post(access_token_url, @params)
      @access_token = JSON.parse(response.body)["access_token"]
      @access_token || fail(ResponseError, 'Get access token failed')
    end

    def access_token_url
      raise NotImplementedError, 'Abstract method'
    end

    def provider
      self.class.name.demodulize.downcase
    end

    def _client
      @_client ||= HTTPClient.new
    end
  end
end
