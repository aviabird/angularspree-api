# This migration comes from spree_favorite_products (originally 20180508095945)
class AddFavoritesUserCountToVariant < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_variants, :favorite_users_count, :integer, default: 0
    add_index :spree_variants, :favorite_users_count
  end
end
