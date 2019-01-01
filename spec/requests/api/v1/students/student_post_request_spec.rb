require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'students API' do
  describe 'POST /api/v1/students/' do
    it 'posts successfully to the db' do
      user = User.create(name: "name_of_user", login: "xyz")
      token = Tokenator.encode(user.login)

      payload = {
        name: "Atreyu",
        email: "never_ending@gmail.com",
        slack_username: "atreyu@slack.com",
        matched: false,
        active: true,
        pronouns: "He/Him",
        background: "Punk Rock",
        stack: "BE",
        identity_marker: ["male-identifying"],
        industries: ["civic tech"]
      }
      post '/api/v1/students', params: {
        student: payload,
        token: token
      }

      student = Student.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(student.name).to eq(payload[:name])
      expect(student.slack_username).to eq(payload[:slack_username])
      expect(student.active).to eq(payload[:active])
      expect(student.matched).to eq(payload[:matched])
      expect(student.pronouns).to eq(payload[:pronouns])
      expect(student.background).to eq(payload[:background])
      expect(student.industries).to eq(payload[:industries])
      expect(student.identity_marker).to eq(payload[:identity_marker])
      expect(student.stack).to eq(payload[:stack])

    end
    it 'does not post successfully with missing attributes' do
      user = User.create(name: "name_of_user", login: "xyz")
      token = Tokenator.encode(user.login)

      payload = {
        name: "Atreyu",
        email: "never_ending@gmail.com",
        active: true
      }

      post '/api/v1/students', params: {
        student: payload,
        token: token
      }

      student = Student.last

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
  end
end
