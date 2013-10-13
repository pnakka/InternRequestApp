class RemoveAddressIdFromContact < ActiveRecord::Migration
  def up
    remove_column :contacts, :address_id
  end

  def down
    add_column :contacts, :address_id, :integer
  end
end
  