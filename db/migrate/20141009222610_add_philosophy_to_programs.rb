class AddPhilosophyToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :philosophy, :text
  end
end
