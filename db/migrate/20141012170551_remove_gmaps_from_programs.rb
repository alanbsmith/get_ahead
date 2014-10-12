class RemoveGmapsFromPrograms < ActiveRecord::Migration
  def change
    remove_column :programs, :gmaps
  end
end
