class CreateIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps null: false
    end

    add_index :identities, %i[uid provider], unique: true
  end
end
