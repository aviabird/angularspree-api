# This migration comes from spree_reviews (originally 20120110172331)
class NamespaceTables < SpreeExtension::Migration[4.2]
  def change
    rename_table :reviews, :spree_reviews
    rename_table :feedback_reviews, :spree_feedback_reviews
  end
end
