require 'rails_helper'

describe 'mentors API' do
  describe 'POST /api/v1/mentors/' do
    it 'posts successfully to the db' do

      payload = {
        name: "Atreyu",
        email: "never_ending@gmail.com",
        city: "New York",
        state: "NY",
        slack_username: "atreyu@slack.com",
        matched: false,
        active: true,
        expertise_tech: ["Ruby", "Rails"],
        identity_preference: ["parent", "veteran"]
      }

      post '/api/v1/mentors', params: {mentor: payload}

      mentor = Mentor.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(mentor.name).to eq(payload[:name])
      expect(mentor.expertise_tech).to eq(payload[:expertise_tech])
      expect(mentor.identity_preference).to eq(payload[:identity_preference])

    end
    it 'does not post successfully with missing attributes' do
      payload = {
        name: "Atreyu",
        email: "never_ending@gmail.com",
        active: true
      }

      post '/api/v1/mentors', params: {mentor: payload}

      mentor = Mentor.last

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
  end
end
