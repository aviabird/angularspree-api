# frozen_string_literal: true

class Api::AccountsController < BaseController
  before_action :check_authorization, except: %i[create]

  def serialization_scope
    current_order
  end

  def create
    @user = Spree::User.create(spree_user_params)
    @order = current_order

    if @user.persisted?
      sign_in(:spree_user, @user)
      @order.update(user: @user) if @order && !@order.user
      @user.generate_spree_api_key!
      UserMailer.user_registration_instructions(@user).deliver
      render_user
    else
      invalid_resource!(@user)
    end
  end

  def show
    authorize! :show, @user
    @order = current_order

    render_user
  end

  def update
    authorize! :update, @user
    @user.update_attributes spree_user_params

    if @user.valid?
      @order = current_order

      render_user
    else
      invalid_resource!(@user)
    end
  end

  def authenticated
    render_user
  end


  private

  def spree_user_params
    params.require(:spree_user).permit(Spree::PermittedAttributes.user_attributes)
  end

  def render_user
    serializer = params[:serializer] == 'full' ? UserSerializer : LiteUserSerializer

    if @user.present? && @user.spree_api_key
      render json: @user,
             root: false,
             scope: @user,
             serializer: serializer
    else
      render json: { status: 'unauthorized' }
    end
  end
end
