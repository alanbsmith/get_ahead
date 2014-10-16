class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer  :program_id
      t.string   :attachment
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
