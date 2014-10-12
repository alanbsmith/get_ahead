class AddDescriptionsToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :description, :string
  end
end
