class CreateEnrichmentActs < ActiveRecord::Migration
  def change
    create_table :enrichment_acts do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
