# This migration comes from spree_events_tracker (originally 20160710173455)
class ChangeQueryStringToText < SpreeExtension::Migration[4.2]
  def up
    change_column :spree_page_events, :query_string, :text
  end

  def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :spree_page_events, :query_string, :string
  end
end
