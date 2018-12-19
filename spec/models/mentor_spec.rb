require 'rails_helper'

RSpec.describe Mentor, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
  end
  it 'exists' do
    mentor = Mentor.new()
    expect(mentor).to be_a(Mentor)
  end
  it 'has attributes' do
    name = "Brandi"
    email = "b@gmail.com"
    city = "Denver"
    state = "CO"
    slack_username = "brandi@slack.com"
    linkedin_username = "brandi@linked_in.com"
    github_username = "brandi@github.com"
    matched = false

    attributes = {
      "name" => "Brandi",
      "email" => "b@gmail.com",
      "city" => "Denver",
      "state" => "CO",
      "slack_username" => "brandi@slack.com",
      "linkedin_username" => "brandi@linked_in.com",
      "github_username" => "brandi@github.com",
      "matched" => false
    }

    mentor = Mentor.new(attributes)

    expect(mentor.name).to eq(name)
    expect(mentor.email).to eq(email)
    expect(mentor.city).to eq(city)
    expect(mentor.state).to eq(state)
    expect(mentor.slack_username).to eq(slack_username)
    expect(mentor.linkedin_username).to eq(linkedin_username)
    expect(mentor.github_username).to eq(github_username)
    expect(mentor.matched).to eq(matched)
  end

  # it 'cannot have a duplicate email' do
  #     attributes_user_1 = {
  #       "name" => "Brandi",
  #       "email" => "b@gmail.com",
  #       "city" => "Denver",
  #       "state" => "CO",
  #       "slack_username" => "brandi@slack.com",
  #       "linkedin_username" => "brandi@linked_in.com",
  #       "github_username" => "brandi@github.com",
  #       "matched" => false
  #     }
  #
  #     attributes_user_2 = {
  #       "name" => "Susan",
  #       "email" => "b@gmail.com",
  #       "city" => "Denver",
  #       "state" => "CO",
  #       "slack_username" => "brandi@slack.com",
  #       "linkedin_username" => "brandi@linked_in.com",
  #       "github_username" => "brandi@github.com",
  #       "matched" => false
  #     }
  #
  #     mentor_1 = Mentor.create(attributes_user_1)
  #     mentor_2 = Mentor.create(attributes_user_2)
  # end
end