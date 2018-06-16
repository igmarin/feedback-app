class CreatePerformanceQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_questions do |t|
      t.string :question
      t.references :performance_review, foreign_key: true

      t.timestamps
    end
  end
end
