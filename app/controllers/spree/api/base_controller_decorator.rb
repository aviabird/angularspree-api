Spree::Api::BaseController.class_eval do
  def api_key
    request.headers['Auth-Token'] || params[:token]
  end
  helper_method :api_key

  def order_token
    request.headers['Order-Token'] || params[:order_token]
  end
end
