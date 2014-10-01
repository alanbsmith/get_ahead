class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string     :facility_name
      t.string     :street_address1
      t.string     :street_address2
      t.string     :city           
      t.string     :state          
      t.string     :zipcode        
      t.string     :phone          
      t.string     :ext            
      t.string     :fax            
      t.string     :program_type   
      t.integer    :enrollment     
      t.timestamps
    end
  end
end
