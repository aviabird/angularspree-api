# frozen_string_literal: true

module Oauth
  module UserInfo
    class Base
      def initialize(info = {})
        @info = info
      end

      def uid; end

      def email; end

      def email_verified?; end
    end

    class Google < Base
      def uid
        @info.fetch('sub')
      end

      def email
        @info.fetch('email')
      end

      def email_verified?
        @info.fetch('email_verified')
      end

      def provider
        'google'
      end
    end

    class Facebook < Base
      def provider
        'facebook'
      end
    end
  end
end
