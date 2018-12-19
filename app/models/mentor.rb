class Mentor < ApplicationRecord
  validates_presence_of :name,
                        :city,
                        :state,
                        :slack_username,
                        :linkedin_username,
                        :github_username,
                        :program

  validates_inclusion_of :matched, in: [true, false]
  validates_inclusion_of :active, in: [true, false]

  validates :email, uniqueness: true, presence: true
end