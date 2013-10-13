class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :Name
      
      t.references :agency

      t.timestamps
    end
  end
end
