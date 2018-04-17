class CreateIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :identities do |t|
      t.references :user, foreign_key: true, null: false
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps null: false
    end

    add_index :identities, [:uid, :provider], unique: true
  end
end
