class CreateFavoritePrograms < ActiveRecord::Migration
  def change
    create_table :favorite_programs do |t|
    t.integer  :favorite_id
    t.integer  :item_id
    t.timestamps
    end
  end
end
