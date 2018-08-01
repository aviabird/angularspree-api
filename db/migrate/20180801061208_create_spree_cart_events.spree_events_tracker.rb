# This migration comes from spree_events_tracker (originally 20160313145434)
class CreateSpreeCartEvents < SpreeExtension::Migration[4.2]
  def change
    create_table :spree_cart_events do |t|
      t.belongs_to :actor, polymorphic: true, index: true
      t.belongs_to :target, polymorphic: true, index: true
      t.string :activity
      t.string :referrer
      t.integer :quantity
      t.decimal :total, precision: 16, scale: 4
      t.string :session_id
      t.belongs_to :variant, index: true
      t.timestamps null: false
    end
  end
end
