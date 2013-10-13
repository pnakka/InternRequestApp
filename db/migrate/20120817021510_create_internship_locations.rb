class CreateInternshipLocations < ActiveRecord::Migration
  def change
    create_table :internship_locations do |t|
      t.integer :phone
      
      t.references :agency
      t.references :county

      t.timestamps
    end
  end
end
