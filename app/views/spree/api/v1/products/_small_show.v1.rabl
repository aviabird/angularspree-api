# frozen_string_literal: true
attributes(:slug)
node(:product_url) { |p| p.master.images.first.attachment.url(:product) }
node(:display_price) { |p| p.display_price.to_s }
