class RemoveInternRequestIdFromInterviewers < ActiveRecord::Migration
  def up
    remove_column :interviewers, :intern_request_id
  end

  def down
    add_column :interviewers, :intern_request_id, :integer
  end
end
