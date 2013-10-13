class CreateAuthorizedPeople < ActiveRecord::Migration
  def change
    create_table :authorized_people do |t|
      t.string :FirstName
      t.string :LastName
      t.string :title
      t.string :department
      t.integer :phone
      t.string :email
      
      t.references :agency

      t.timestamps
    end
  end
end
