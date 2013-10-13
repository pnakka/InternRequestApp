class AddAddressIdToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :address_id, :integer
    add_column :agencies, :county_id, :integer
  end
end
