class AddAgencyIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :agency_id, :integer
  end
end
