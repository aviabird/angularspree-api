# This migration comes from spree_admin_roles_and_access (originally 20170503090436)
class CreateSpreePermissionSets < ActiveRecord::Migration[4.2]
  def change
    create_table :spree_permission_sets do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
