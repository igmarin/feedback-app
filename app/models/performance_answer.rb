class PerformanceAnswer < ApplicationRecord
  belongs_to :performance_question
  belongs_to :performance_review
end
