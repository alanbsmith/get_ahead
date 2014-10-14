class RemoveAdminIdFromPrograms < ActiveRecord::Migration
  def change
    remove_column :programs, :admin_id
    add_column    :programs, :user_id, :integer
  end
end
