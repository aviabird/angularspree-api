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

  def update_address 
    if params[:user][:email].blank?
      render json: { errors: 'Address can not be update' }, status: 422
    else
      user= Spree::User.find_by!(email: params[:user][:email])
      hashParams = (params[:user][:ship_address].to_unsafe_h)
      updated = user.ship_address.update(hashParams)      
      render json: {status: "Address updated Successfully!"} if updated
    end 
  end

  def create_address 
    if params[:user][:email].blank?
      render json: { errors: 'Address can not be added' }, status: 422
    else
      user= Spree::User.find_by!(email: params[:user][:email])
      hashParams = (params[:user][:ship_address].to_unsafe_h)
      updated = user.create_ship_address(hashParams)
      user.save      
      render json: {status: "Address added Successfully!"} if updated
    end 
  end
end
