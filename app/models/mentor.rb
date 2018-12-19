class Mentor < ApplicationRecord
  attr_reader :name,
  :email,
  :city,
  :state,
  :slack_username,
  :linkedin_username,
  :github_username,
  :matched,
  :user_id

  def initialize(attributes)
    if attributes
      @name = attributes["name"]
      @email = attributes["email"]
      @city = attributes["city"]
      @state = attributes["state"]
      @slack_username = attributes["slack_username"]
      @linkedin_username = attributes["linkedin_username"]
      @github_username = attributes["github_username"]
      @matched = attributes["matched"]
      @user_id = attributes["user_id"]
    end
  end
end