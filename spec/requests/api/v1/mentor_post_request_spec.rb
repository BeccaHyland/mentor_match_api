require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'mentors API' do
  describe 'POST /api/v1/mentors/' do
    it 'posts successfully to the db' do
      user = User.create(name: "name_of_user", login: "xyz")
      token = Tokenator.encode(user.login)
      
      payload = {
        name: "Atreyu",
        email: "never_ending@gmail.com",
        city: "New York",
        state: "NY",
        country: "USA",
        slack_username: "atreyu@slack.com",
        matched: false,
        active: true,
        pronouns: "He/Him",
        current_title: "Software Developer",
        current_employer: "Atlantic Records",
        background: "Punk Rock",
        mentee_capacity: 1,
        meeting_location: ["Turing"],
        industries: ["here", "there"],
        ways_to_mentor: ["wisdom", "insight"],
        expertise_tech: ["wisdom", "insight"],
        expertise_non_tech: ["wisdom", "insight"],
        stack_preference: "BE",
        identity_preference: ["male-identifying"],
        expertise_tech: ["Ruby", "Rails"],
        identity_preference: ["parent", "veteran"]
      }
      post '/api/v1/mentors', params: {
        mentor: payload,
        token: token
      }

      mentor = Mentor.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(mentor.name).to eq(payload[:name])
      expect(mentor.city).to eq(payload[:city])
      expect(mentor.state).to eq(payload[:state])
      expect(mentor.country).to eq(payload[:country])
      expect(mentor.slack_username).to eq(payload[:slack_username])
      expect(mentor.active).to eq(payload[:active])
      expect(mentor.matched).to eq(payload[:matched])
      expect(mentor.pronouns).to eq(payload[:pronouns])
      expect(mentor.current_title).to eq(payload[:current_title])
      expect(mentor.current_employer).to eq(payload[:current_employer])
      expect(mentor.background).to eq(payload[:background])
      expect(mentor.mentee_capacity).to eq(payload[:mentee_capacity])
      expect(mentor.meeting_location).to eq(payload[:meeting_location])
      expect(mentor.industries).to eq(payload[:industries])
      expect(mentor.ways_to_mentor).to eq(payload[:ways_to_mentor])
      expect(mentor.expertise_tech).to eq(payload[:expertise_tech])
      expect(mentor.expertise_non_tech).to eq(payload[:expertise_non_tech])
      expect(mentor.identity_preference).to eq(payload[:identity_preference])
      expect(mentor.stack_preference).to eq(payload[:stack_preference])

    end
    it 'does not post successfully with missing attributes' do
      user = User.create(name: "name_of_user", login: "xyz")
      token = Tokenator.encode(user.login)

      payload = {
        name: "Atreyu",
        email: "never_ending@gmail.com",
        active: true
      }

      post '/api/v1/mentors', params: {
        mentor: payload,
        token: token
      }

      mentor = Mentor.last

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
  end
end
