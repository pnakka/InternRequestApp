class DropInternRequests < ActiveRecord::Migration
  def up
    drop_table :intern_requests
  end

  def down
    
  end
end
