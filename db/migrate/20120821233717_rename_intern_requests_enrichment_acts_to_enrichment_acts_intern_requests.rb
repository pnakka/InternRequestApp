class RenameInternRequestsEnrichmentActsToEnrichmentActsInternRequests < ActiveRecord::Migration
  def up
    rename_table :internrequests_enrichmentacts, :enrichment_acts_intern_requests
  end

  def down
    rename_table :enrichment_acts_intern_requests, :internrequests_enrichmentacts 
  end
end
