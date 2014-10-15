class ChangeDescriptionsToTextForRatings < ActiveRecord::Migration
  def change
    remove_column :reviews, :description
    add_column    :reviews, :description, :text
  end
end
