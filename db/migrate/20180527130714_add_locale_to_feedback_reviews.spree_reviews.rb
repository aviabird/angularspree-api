# This migration comes from spree_reviews (originally 20120712182627)
class AddLocaleToFeedbackReviews < SpreeExtension::Migration[4.2]
  def self.up
    add_column :spree_feedback_reviews, :locale, :string, default: 'en'
  end

  def self.down
    remove_column :spree_feedback_reviews, :locale
  end
end
