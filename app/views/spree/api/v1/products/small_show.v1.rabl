# frozen_string_literal: true
attributes(:slug)

node(:product_url) do |p|
  image = p.master.images.first
  image && main_app.url_for(image.url(:product))
end

node(:display_price) { |p| p.display_price.to_s }
