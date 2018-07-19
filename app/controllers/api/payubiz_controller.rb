# frozen_string_literal: true

class Api::PayubizController < BaseController
  before_action :check_authorization, except: %i[handle_payment canceled_payment]

  def handle_payment
    transaction_id = params[:txnid]
    mihpayid = params[:mihpayid]
    order_id = params[:udf1]
    @current_order = Spree::Order.find_by_number(order_id)
    #Assuming that we do not having partial payments(one stroke payment only)
    result = @current_order.payments.first.complete if params[:status]== 'success'

    if result
      @current_order.payments.first.update(response_code: mihpayid)
      url = "#{ENV['FRONT_END_URL']}checkout/order-success?orderReferance=#{order_id}"  
      redirect_to url  
    else
      render json: {status: "Invalid Payment"}
    end
  end

  def canceled_payment
    #WIP when user cancel payments
    url = "#{ENV['FRONT_END_URL']}"
      redirect_to url  
  end
end
