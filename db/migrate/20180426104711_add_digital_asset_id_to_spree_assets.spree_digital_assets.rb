# This migration comes from spree_digital_assets (originally 20160308092647)
class AddDigitalAssetIdToSpreeAssets < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_assets, :digital_asset_id, :integer
    add_index :spree_assets, :digital_asset_id
  end
end
