class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :StreetNumber
      t.string :StreetName
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
