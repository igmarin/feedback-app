class PerformanceQuestion < ApplicationRecord
  belongs_to :performance_review
  has_one :performance_question
end
