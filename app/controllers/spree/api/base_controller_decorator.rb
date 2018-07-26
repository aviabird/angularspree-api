Spree::Api::BaseController.class_eval do
  def api_key
    request.headers['Auth-Token'] || params[:token]
  end
  helper_method :api_key

  def order_token
    request.headers['Order-Token'] || params[:order_token]
  end

  def load_user
    return nil if api_key.blank?
    @current_api_user = Spree.user_class.find_by(spree_api_key: api_key.to_s)
  end
end
