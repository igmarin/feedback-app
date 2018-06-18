class PerformanceReview < ApplicationRecord
  belongs_to :user
  has_many :performance_questions, dependent: :destroy
  has_many :performance_answares, dependent: :destroy
  has_many :reviewers, dependent: :destroy
  has_many :users, through: :reviewers

  validates :user, :due_date, :title, presence: true

  def reviewers_emails
    self.users.select(:email).to_a
  end

  def user_email
    user.email
  end
end
