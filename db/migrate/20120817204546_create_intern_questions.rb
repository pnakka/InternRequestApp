class CreateInternQuestions < ActiveRecord::Migration
  def change
    create_table :intern_questions do |t|
      t.string :name
      t.boolean :value

      t.timestamps
    end
  end
end
