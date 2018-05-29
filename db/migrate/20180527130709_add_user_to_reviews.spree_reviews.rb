# This migration comes from spree_reviews (originally 20110606150524)
class AddUserToReviews < SpreeExtension::Migration[4.2]
  def self.up
    add_column :reviews, :user_id, :integer, null: true
  end

  def self.down
    remove_column :reviews, :user_id
  end
end
