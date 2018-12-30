class Mentor < ApplicationRecord
  validates_presence_of :name,
                        :city

  validates :email, uniqueness: true, presence: true

  has_many :mentor_preferences
  has_many :preferences, through: :mentor_preferences

  has_many :student_mentors
  has_many :students, through: :student_mentors
end
