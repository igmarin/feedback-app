class PerformanceReview < ApplicationRecord
  has_many :performance_questions, dependent: :destroy
  has_many :performance_answares, dependent: :destroy
  has_many :reviewers
end
