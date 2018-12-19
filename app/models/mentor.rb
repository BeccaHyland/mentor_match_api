class Mentor < ApplicationRecord
  validates_presence_of :name,
                        :city,
                        :state,
                        :slack_username,
                        :linkedin_username,
                        :github_username,
                        :matched

  validates :email, uniqueness: true
end