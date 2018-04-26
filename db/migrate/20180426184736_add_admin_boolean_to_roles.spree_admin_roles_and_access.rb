# This migration comes from spree_admin_roles_and_access (originally 20170509090346)
class AddAdminBooleanToRoles < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_roles, :admin_accessible, :boolean, default: false
  end
end
