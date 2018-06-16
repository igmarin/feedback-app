class CreateJoinTablePerformanceReviewsUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :performance_reviews do |t|
      t.index [:user_id, :performance_review_id], name: 'index_user_performance_review'
      t.index [:performance_review_id, :user_id], name: 'index_performance_review_user'
    end
  end
end
