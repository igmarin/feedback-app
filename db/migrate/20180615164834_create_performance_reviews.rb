class CreatePerformanceReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_reviews do |t|
      t.string :title
      t.datetime :due_date

      t.timestamps
    end
  end
end
