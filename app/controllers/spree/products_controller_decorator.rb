
# frozen_string_literal: true

Spree::ProductsController.class_eval do
  skip_before_action :set_current_order, only: :recently_viewed
  after_action :save_recently_viewed, only: :recently_viewed

  helper Spree::ReviewsHelper

  reviews_fields = %i[avg_rating reviews_count]
  reviews_fields.each { |attrib| Spree::PermittedAttributes.product_attributes << attrib }

  Spree::Api::ApiHelpers.class_eval do
    reviews_fields.each { |attrib| class_variable_set(:@@product_attributes, class_variable_get(:@@product_attributes).push(attrib)) }
  end
  
  def recently_viewed
    products_ids = cookies['recently_viewed_products']&.split(',')&.map(&:to_i)
    products = Spree::Product
               .find_by_array_of_ids(products_ids)
               .includes(master: :images)
    render json: { products: products }
  end

  private

  def save_recently_viewed
    id = params[:product_id]
    return unless id.present?
    rvp = (cookies['recently_viewed_products'] || '').split(', ')
    rvp.delete(id)
    rvp << id unless rvp.include?(id.to_s)
    # Maximum 10 products can be displayed is recently viewded.
    rvp_max_count = 10
    rvp.delete_at(0) if rvp.size > rvp_max_count.to_i
    cookies['recently_viewed_products'] = rvp.join(', ')
  end
end
