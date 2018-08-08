# frozen_string_literal: true
attributes(:slug, :name)

node(:product_url) do |p|
  image = p.master.images.first
  image && main_app.url_for(image.url(:product))
end

node(:price) { |p| p.price }
node(:cost_price) { |p| p.master.cost_price.to_s }
node(:avg_rating) {|p| p.avg_rating}
node(:reviews_count) {|p| p.reviews_count}
node(:currency) { current_currency }
node(:currency_symbol) { Money::Currency.table[current_currency.underscore.to_sym][:symbol] }