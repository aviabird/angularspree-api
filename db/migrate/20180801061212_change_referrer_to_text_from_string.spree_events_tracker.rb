# This migration comes from spree_events_tracker (originally 20160710182337)
class ChangeReferrerToTextFromString < SpreeExtension::Migration[4.2]
  def up
    change_column :spree_cart_events, :referrer, :text
    change_column :spree_page_events, :referrer, :text
    change_column :spree_checkout_events, :referrer, :text
  end

  def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :spree_cart_events, :referrer, :string
    change_column :spree_page_events, :referrer, :string
    change_column :spree_checkout_events, :referrer, :string
  end

end
