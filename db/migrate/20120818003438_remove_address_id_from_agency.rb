class RemoveAddressIdFromAgency < ActiveRecord::Migration
  def up
    remove_column :agencies, :address_id
  end

  def down
    add_column :agencies, :address_id, :integer
  end
end
