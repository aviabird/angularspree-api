# frozen_string_literal: true

attributes *product_attributes
node(:price) { |p| p.price }
node(:currency) { Money::Currency.table[current_currency.underscore.to_sym][:symbol] }
node(:has_variants, &:has_variants?)
node(:taxon_ids, &:taxon_ids)
node(:cost_price) { |p| p.cost_price.to_s }

# check whether the product is favorited by current user
node :is_favorited_by_current_user do |p|
  @current_api_user ? @current_api_user.favorite_products.ids.include?(p.id) : false
end
