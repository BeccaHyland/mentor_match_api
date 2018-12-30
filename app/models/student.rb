class Student < ApplicationRecord
  validates_presence_of :name

  validates :email, uniqueness: true, presence: true

  has_many :student_mentors
  has_many :mentors, through: :student_mentors
end