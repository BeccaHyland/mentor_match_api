require 'rails_helper'

RSpec.describe Mentor, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:city)}
  end

  describe 'model tests' do
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
      stack_preference = "BE"
      identity_preference = ["veteran", "female-identifying"]

      attributes = {
        "name" => name,
        "email" => email,
        "city" => city,
        "state" => state,
        "slack_username" => slack_username,
        "stack_preference" => stack_preference,
        "identity_preference" => identity_preference
      }

      mentor = Mentor.new(attributes)

      expect(mentor.name).to eq(name)
      expect(mentor.email).to eq(email)
      expect(mentor.city).to eq(city)
      expect(mentor.state).to eq(state)
      expect(mentor.slack_username).to eq(slack_username)
      expect(mentor.stack_preference).to eq(stack_preference)
      expect(mentor.identity_preference).to eq(identity_preference)
      expect(mentor.matched).to eq(false)
      expect(mentor.active).to eq(true)
    end
  end

  # it 'cannot have a duplicate email' do
  #     attributes_user_1 = {
  #       "name" => "Brandi",
  #       "email" => "b@gmail.com",
  #       "city" => "Denver",
  #       "state" => "CO",
  #       "slack_username" => "brandi@slack.com",
  #     }
  #
  #     attributes_user_2 = {
  #       "name" => "Susan",
  #       "email" => "b@gmail.com",
  #       "city" => "Denver",
  #       "state" => "CO",
  #       "slack_username" => "brandi@slack.com",
  #     }
  #
  #     mentor_1 = Mentor.create(attributes_user_1)
  #     mentor_2 = Mentor.create(attributes_user_2)
  # end
end
