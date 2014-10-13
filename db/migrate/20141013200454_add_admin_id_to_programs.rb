class AddAdminIdToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :admin_id, :integer
  end
end
