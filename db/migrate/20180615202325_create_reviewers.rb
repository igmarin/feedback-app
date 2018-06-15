class CreateReviewers < ActiveRecord::Migration[5.2]
  def change
    create_table :reviewers do |t|
      t.references :performance_review, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
