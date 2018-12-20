class Mentor < ApplicationRecord
  validates_presence_of :name,
                        :city,
                        :state,
                        :slack_username,
                        :linkedin_username,
                        :github_username,
                        :matched

  validates :email, uniqueness: true, presence: true

  has_many :mentor_preferences
  has_many :preferences, through: :mentor_preferences
end