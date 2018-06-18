class Reviewer < ApplicationRecord
  belongs_to :user
  belongs_to :performance_review
  before_save :same_due_date_pr

  def user_to_be_reviewed
    self.performance_review.user_email
  end

  def same_due_date_pr
    self.due_date = self.performance_review.due_date
  end
end
