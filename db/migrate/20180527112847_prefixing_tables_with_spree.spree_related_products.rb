# This migration comes from spree_related_products (originally 20111129044813)
class PrefixingTablesWithSpree < SpreeExtension::Migration[4.2]
  def change
    rename_table :relation_types, :spree_relation_types
    rename_table :relations, :spree_relations
  end
end
