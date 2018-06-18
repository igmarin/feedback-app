class CreatePerformanceAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_answers do |t|
      t.references :performance_question, foreign_key: true
      t.string :question
      t.references :performance_review, foreign_key: true

      t.timestamps
    end
  end
end
