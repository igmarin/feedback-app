class AddUserToPerformanceReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :performance_reviews, :user, foreign_key: true
  end
end
