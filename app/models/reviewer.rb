class Reviewer < User
  has_and_belongs_to_many :performance_reviews
end
