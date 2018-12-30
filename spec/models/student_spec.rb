require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:name)}
  end

  describe 'model tests' do
    it 'exists' do
      student = Student.new()
      expect(student).to be_a(Student)
    end
    it 'has attributes' do
      name = "Val"
      email = "v@gmail.com"
      slack_username = "val@slack.com"
      stack = "FE"
      identity_marker = ["veteran", "female-identifying"]

      attributes = {
        "name" => name,
        "email" => email,
        "slack_username" => slack_username,
        "stack" => stack,
        "identity_marker" => identity_marker
      }

      student = Student.new(attributes)

      expect(student.name).to eq(name)
      expect(student.email).to eq(email)
      expect(student.slack_username).to eq(slack_username)
      expect(student.stack).to eq(stack)
      expect(student.identity_marker).to eq(identity_marker)
      expect(student.matched).to eq(false)
      expect(student.active).to eq(true)
    end
  end

end
