class AddLatLongAndGmapsToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :latitude, :float
    add_column :programs, :longitude, :float
    add_column :programs, :gmaps, :boolean
  end
end
