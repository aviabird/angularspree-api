# This migration comes from spree_digital_assets (originally 20171025100108)
class AddApprovedBooleanToDigitalAssets < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_digital_assets, :approved, :boolean, default: true, null: false
  end
end
