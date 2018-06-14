# This migration comes from spree_favorite_products (originally 20180508000000)
class RemoveIndexesFromSpreeFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_index :spree_favorites, [:user_id, :product_id]
  end
end
