# frozen_string_literal: true
class Api::PayubizController < BaseController
  before_action :check_authorization, except: %i[handle_payment canceled_payment]
  skip_before_action :verify_authenticity_token, only: %i[canceled_payment handle_payment]

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
    reason = params[:error_Message]
    order_id=params[:udf1]
    url = "#{ENV['FRONT_END_URL']}checkout/order-failed?orderReferance=#{order_id}&reason=#{reason}"  
    redirect_to url  
  end

  def post_request_payubiz
    require "uri"
    require "net/http"
    payuBizUrl= "#{ENV['PAYUBIZ_URL']}"
    payu = params[:params]
    payu_params = {'key'=>payu[:key],'txnid'=>payu[:txnid],
      'amount'=>payu[:amount],'productinfo'=>payu[:productinfo], 'firstname'=>payu[:firstname], 
      'email'=>payu[:email], 'phone'=>payu[:phone],'udf1'=>payu[:udf1],
      'surl'=>payu[:surl], 'furl'=>payu[:furl], 'hash'=>payu[:hash]}
        
    begin
      response = Net::HTTP.post_form URI(payuBizUrl),payu_params
      render json: {url: response['location']}
    rescue
      render json: {error: 'Could not  process the payment.'}
    end
  end
end
