# This migration comes from spree_reviews (originally 20120712182514)
class AddLocaleToReviews < SpreeExtension::Migration[4.2]
  def self.up
    add_column :spree_reviews, :locale, :string, default: 'en'
  end

  def self.down
    remove_column :spree_reviews, :locale
  end
end
