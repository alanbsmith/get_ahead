class ChangeDescriptionsToText < ActiveRecord::Migration
  def change
    remove_column :programs, :description
    add_column    :programs, :description, :text
  end
end
