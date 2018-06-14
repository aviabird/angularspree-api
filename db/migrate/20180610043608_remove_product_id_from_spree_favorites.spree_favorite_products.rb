# This migration comes from spree_favorite_products (originally 20180508074838)
class RemoveProductIdFromSpreeFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :spree_favorites, :product_id, :integer
  end
end
