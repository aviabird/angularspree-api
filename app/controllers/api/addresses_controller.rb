# frozen_string_literal: true

class Api::AddressesController < BaseController
  before_action :check_authorization, except: %i[shipment_availability]

  def destroy
    authorize! :update, @user

    address = @user.addresses.find params[:id]
    address.destroy
    @user.touch

    render json: address,
           scope: @user,
           serializer: AddressSerializer,
           root: false
  end

  def shipment_availability
    result = DeliveryPincode.find_by(pincode: params[:pincode])
    render json: {available: true } if result !=nil
    render json: {available: false } if result == nil
  end
end
