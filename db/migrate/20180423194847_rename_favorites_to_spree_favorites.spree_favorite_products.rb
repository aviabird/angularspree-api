# This migration comes from spree_favorite_products (originally 20130710105100)
class RenameFavoritesToSpreeFavorites < SpreeExtension::Migration[4.2]
  def change
    rename_table :favorites, :spree_favorites
    add_index :spree_favorites, [:user_id, :product_id], unique: true
    add_index :spree_favorites, :user_id
  end
end
