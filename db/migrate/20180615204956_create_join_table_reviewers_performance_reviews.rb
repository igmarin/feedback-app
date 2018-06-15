class CreateJoinTableReviewersPerformanceReviews < ActiveRecord::Migration[5.2]
  def change
    create_join_table :reviewers, :performance_reviews do |t|
       t.index [:reviewer_id, :performance_review_id], name: 'index_reviewer_performace_review'
       t.index [:performance_review_id, :reviewer_id], name: 'index_performace_review_reviewer'
    end
  end
end
