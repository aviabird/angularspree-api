# frozen_string_literal: true

object false

child(root: :pagination) do
  node(:count) { @products.count }
  node(:total_count) { @products.total_count }
  node(:current_page) { params[:page] ? params[:page].to_i : 1 }
  node(:per_page) { params[:per_page].try(:to_i) || Kaminari.config.default_per_page }
  node(:pages) { @products.total_pages }
end

child(@products => :data) do
  extends 'spree/api/v1/products/ng_show'
end

