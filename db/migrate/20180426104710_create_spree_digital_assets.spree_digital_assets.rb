# This migration comes from spree_digital_assets (originally 20160223071609)
class CreateSpreeDigitalAssets < SpreeExtension::Migration[4.2]
  def change
    create_table :spree_digital_assets do |t|
      t.string :name
      t.attachment :attachment
      t.references :folder

      t.timestamps null: false
    end
  end
end
