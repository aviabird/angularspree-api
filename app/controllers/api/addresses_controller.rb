# frozen_string_literal: true

class AddressesController < BaseController
  before_action :check_authorization

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
end
