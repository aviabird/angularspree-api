# This migration comes from spree_related_products (originally 20120208144454)
class UpdateRelationTypes < SpreeExtension::Migration[4.2]
  def up
    Spree::RelationType.where(applies_to: 'Product').update_all(applies_to: 'Spree::Product')
  end

  def down
    Spree::RelationType.where(applies_to: 'Spree::Product').update_all(applies_to: 'Product')
  end
end
