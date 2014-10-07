class ReplaceItemIdWithProgramId < ActiveRecord::Migration
  def change
    remove_column :favorite_programs, :item_id
    add_column :favorite_programs, :program_id, :integer
    remove_column :favorites, :program_id
  end
end
