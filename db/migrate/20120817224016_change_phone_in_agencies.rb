class ChangePhoneInAgencies < ActiveRecord::Migration
  def up
    #change_column :table_name, :column_name, :new_type
    
    change_table :agencies do |t|
      t.change :phone, :integer
    end
  end

  def down
    change_table :agencies do |t|
      t.change :phone, :string
    end
  end
end
