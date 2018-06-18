class CreateReviewers < ActiveRecord::Migration[5.2]
  def change
    create_table :reviewers do |t|
      t.references :user, foreign_key: true
      t.references :performance_review, foreign_key: true
      t.datetime :due_date
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
