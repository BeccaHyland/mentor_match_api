class Preference < ApplicationRecord
  validates_presence_of :title

  has_many :mentor_preferences
  has_many :mentors, through: :mentor_preferences
end