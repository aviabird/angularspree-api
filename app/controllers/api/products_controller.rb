# frozen_string_literal: true

class Api::ProductsController < BaseController
  before_action :find_taxon_id, only: :index

  def index
    searcher = Spree::Config.searcher_class.new(params)

    @products = searcher.retrieve_products

    @cache_key = [I18n.locale,
                  @current_user_roles.include?('admin'),
                  current_currency,
                  params.slice(:keywords, :search, :taxon,
                               :taxons, :option_types,
                               :browse_mode, :price_min,
                               :price_max, :properties,
                               :sorting, :per_page, :page).to_s]

    render json: @products,
           each_serializer: ProductSerializer,
           root: :products,
           meta: {
             count: @products.count,
             total_count: @products.total_count,
             current_page: (params[:page] || 1).to_i,
             per_page: params[:per_page] || Spree::Config.products_per_page,
             pages: @products.num_pages
           }
  end

  def show
    @product = product_scope.find_by!(slug: params[:id])

    render json: @product,
           root: false,
           serializer: ProductSerializer
  end

  ####################### PRIVATE METHODS #############################
  private

  def product_scope
    Spree::Product.active.includes(:option_types, :taxons, master: %i[images option_values prices], product_properties: [:property], variants: %i[images option_values prices])
  end

  def find_taxon_id
    if params[:taxon] && params[:taxon].to_i == 0
      params[:taxon] = Spree::Taxon.find_by!(permalink: params[:taxon]).id
    end
  end
end
