object false
  child(@orders => :orders) do
    extends 'spree/api/v1/orders/show'
  end

  node(:count) { @orders.count }
  node(:current_page) { params[:page].try(:to_i) || 1 }
  node(:pages) { @orders.total_pages }
  node(:total_count) {@orders.total_count}
  node(:per_page) { params[:per_page].try(:to_i) || Kaminari.config.default_per_page }
