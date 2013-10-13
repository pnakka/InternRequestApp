class CreateInternRequestsEnrichmentActs < ActiveRecord::Migration
  
  
  
  def up
    
    create_table :InternRequests_EnrichmentActs, :id => false do |t|
      t.references :intern_request
      t.references :enrichment_act
    end

  end

  def down
    drop_table :InternRequests_EnrichmentActs
  end
end
