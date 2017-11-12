module Oauth
  PROVIDERS = {
      :google => Oauth::Google
  }

  class OauthError < StandardError; end
  class OauthProviderNotImplemented < OauthError; end
  class MissingTokenError < OauthError; end
  class ResponseError < OauthError; end

  def self.for(provider)
    PROVIDERS.fetch(provider.to_sym) { raise OauthProviderNotImplemented }
  end
end