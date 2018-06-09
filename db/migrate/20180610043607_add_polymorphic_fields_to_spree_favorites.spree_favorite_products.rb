# This migration comes from spree_favorite_products (originally 20180508074324)
class AddPolymorphicFieldsToSpreeFavorites < ActiveRecord::Migration[5.1]
  def change
    add_reference(:spree_favorites, :favoritable, polymorphic: true, index: true)
  end
end
