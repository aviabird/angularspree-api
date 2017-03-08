class BaseController < Spree::BaseController
  include Spree::Core::ControllerHelpers::Order

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  respond_to :json

  layout false

  helper Spree::Api::ApiHelpers

  before_action :set_current_user
  before_action :load_user_roles
  # before_action :set_language

protected
  def set_language
    I18n.locale = if session.key?(:locale)
                    session[:locale]
                  else
                    Rails.application.config.i18n.default_locale || I18n.default_locale
                  end
  end

  def unauthorized
    render json: {status: 'unauthorized'},status: 401
  end

  def check_authorization
    @user = @spree_current_user
    unauthorized unless @user
  end

  def current_currency
    Spree::Config[:currency]
  end
  helper_method :current_currency

  def load_user_roles
    @current_user_roles = if @spree_current_user
      @spree_current_user.spree_roles.pluck(:name)
    else
      []
    end
  end

  def set_current_user
    token = request.headers["X-Spree-Token"]
    @spree_current_user = Spree::User.find_by_spree_api_key(token)
  end

end