class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
  belongs_to :role

  has_many :reviewers
  has_many :performance_reviews, through: :reviewers

  has_and_belongs_to_many :performance_reviews

  before_create :set_default_role

  def admin?
    role.name == 'admin'
  end

  def to_s
    email
  end

  private
  def set_default_role
    role ||= Role.find_by(name: 'employee')
  end
end
