class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer    :user_id
      t.integer    :program_id
      t.string     :title
      t.string     :description          
      t.float      :score                            
      t.timestamps
    end
  end
end
