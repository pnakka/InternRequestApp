class RemoveInternRequestIdFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :intern_request_id
  end

  def down
    add_column :jobs, :intern_request_id, :integer
  end
end
