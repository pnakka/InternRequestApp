class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Email
      t.integer :phone
      
      t.references :agency
      t.references :address

      t.timestamps
    end
  end
end
