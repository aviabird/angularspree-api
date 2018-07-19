class CreateDeliveryPincodes < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_pincodes do |t|
      t.string :pincode

      t.timestamps
    end
  end
end
