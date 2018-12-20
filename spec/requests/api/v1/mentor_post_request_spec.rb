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
        linkedin_username: "atreyu@linked_in.com",
        github_username: "atreyu@github.com",
        program: "FE",
        matched: false,
        active: true
      }

      post '/api/v1/mentors', params: {mentor: payload}

      mentor = Mentor.last

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(mentor.name).to eq(payload[:name])

    end
  end
end