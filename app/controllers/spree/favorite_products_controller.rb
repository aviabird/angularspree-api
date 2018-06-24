# frozen_string_literal: true

class Spree::FavoriteProductsController < BaseController
  before_action :check_authorization, except: [:index]

  def index
    @products = Spree::Product.favorite
                              .includes(master: :images)
                              .order('favorite_users_count asc')
                              .page(params[:page])
                              .per(params[:per_page])
    respond_with(@products, template: 'spree/api/v1/products/index')
  end

  def create
    favorite = spree_current_user.favorites.new(favoritable_id: params[:id], favoritable_type: 'Spree::Product')
    message = if favorite.save
                Spree.t(:success, scope: %i[favorite_products create])
              else
                favorite.errors.full_messages.to_sentence
              end

    render json: { message: message }
  end

  def destroy
    favorite = spree_current_user.favorites.find_by(favoritable_id: params[:id])
    favorite.destroy

    render json: { message: t('favorite_products.destroy.success') }
  end

  def user_favorite_products
    @products = spree_current_user
                        .favorite_products
                        .page(params[:page])
                        .per(Spree::Config.favorite_products_per_page)
    respond_with(@products, template: 'spree/api/v1/products/index')
  end
end
