require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'mentors API' do
  describe 'GET /api/v1/mentors' do
    it 'returns all mentors in db' do
      user = User.create(name: "name_of_user", login: "xyz")
      token = Tokenator.encode(user.login)

      mentor_1 = Mentor.create(name: "test mentor 1", email: "test@email.com", city: "Test City", state: "CO", slack_username: "test1")
      mentor_2 = Mentor.create(name: "test mentor 2", email: "test@contact.com", city: "Test Town", state: "CO", slack_username: "test2")

      get '/api/v1/mentors', params: {
        token: token
      }

      expect(response.status).to eq(200)

      get_response = JSON.parse(response.body, symbolize_names: true)

      expect(get_response[:data]).to be_an(Array)
      expect(get_response[:data].length).to eq(2)

      expect(get_response[:data].first[:attributes][:name]).to eq(mentor_1[:name])
      expect(get_response[:data].first[:attributes][:email]).to eq(mentor_1[:email])
      expect(get_response[:data].first[:attributes][:city]).to eq(mentor_1[:city])
      expect(get_response[:data].first[:attributes][:state]).to eq(mentor_1[:state])
      expect(get_response[:data].first[:attributes][:slack_username]).to eq(mentor_1[:slack_username])
      expect(get_response[:data].first[:attributes][:matched]).to eq(mentor_1[:matched])
      expect(get_response[:data].first[:attributes][:active]).to eq(mentor_1[:active])

      expect(get_response[:data].second[:attributes][:name]).to eq(mentor_2[:name])

    end
  end
end
