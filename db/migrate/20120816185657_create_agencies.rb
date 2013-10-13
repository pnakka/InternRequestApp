class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :AgencyName
      t.integer :phone
      t.string :email
      
      
      t.timestamps
    end
  end
end
