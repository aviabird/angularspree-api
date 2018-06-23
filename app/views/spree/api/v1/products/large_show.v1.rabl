# frozen_string_literal: true

attributes *product_attributes
node(:display_price) { |p| p.display_price.to_s }
node(:has_variants, &:has_variants?)
node(:taxon_ids, &:taxon_ids)

# check whether the product is favorited by current user
node :is_favorited_by_current_user do |p|
  @current_api_user ? @current_api_user.favorite_products.ids.include?(p.id) : false
end
