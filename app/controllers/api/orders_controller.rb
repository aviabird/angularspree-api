# frozen_string_literal: true

module Api
  class OrdersController < BaseController
    before_action :check_authorization, only: :index

    def index
      @orders = @user.orders.complete

      render json: @orders,
             scope: spree_current_user,
             each_serializer: LiteOrderSerializer,
             root: false
    end

    def show
      token = request.headers['Order-Token']

      if token.present?
        @order = Spree::Order.find_by!(number: params[:id], guest_token: token)
      else
        check_authorization
        authorize! :show, @user
        @order = @user.orders.find_by!(number: params[:id])
      end

      render json: @order,
             scope: spree_current_user,
             serializer: OrderSerializer,
             root: false
    end
  end
end
