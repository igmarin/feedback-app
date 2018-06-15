class PerformanceReview < ApplicationRecord
  belongs_to :user
  has_many :performance_questions, dependent: :destroy
  has_many :performance_answares, dependent: :destroy
  has_and_belongs_to_many :reviewers

  validates :user, :due_date, :title, presence: true
end
