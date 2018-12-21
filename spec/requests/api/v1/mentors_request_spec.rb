require 'rails_helper'

describe 'mentors API' do
  describe 'GET /api/v1/mentors' do
    it 'returns all mentors in db' do

    mentor_1 = Mentor.create(name: "test mentor 1", email: "test@email.com", city: "Test City", state: "CO", slack_username: "test1", linkedin_username: "test1", github_username: "test1", program: "BE")
    mentor_2 = Mentor.create(name: "test mentor 2", email: "test@contact.com", city: "Test Town", state: "CO", slack_username: "test2", linkedin_username: "test2", github_username: "test2", program: "FE")

    mentor_1.preferences.create!(title: "veteran")
    mentor_1.preferences.create!(title: "female-identifying")
    mentor_2.preferences.create!(title: "parent")

      #payload = { }

      get '/api/v1/mentors'

      expect(response.status).to eq(200)

      get_response = JSON.parse(response.body, symbolize_names: true)

      expect(get_response[:data]).to be_an(Array)
      expect(get_response[:data].length).to eq(2)

      expect(get_response[:data].first[:attributes][:name]).to eq(mentor_1[:name])
      expect(get_response[:data].first[:attributes][:email]).to eq(mentor_1[:email])
      expect(get_response[:data].first[:attributes][:city]).to eq(mentor_1[:city])
      expect(get_response[:data].first[:attributes][:state]).to eq(mentor_1[:state])
      expect(get_response[:data].first[:attributes][:slack_username]).to eq(mentor_1[:slack_username])
      expect(get_response[:data].first[:attributes][:linkedin_username]).to eq(mentor_1[:linkedin_username])
      expect(get_response[:data].first[:attributes][:github_username]).to eq(mentor_1[:github_username])
      expect(get_response[:data].first[:attributes][:matched]).to eq(mentor_1[:matched])
      expect(get_response[:data].first[:attributes][:active]).to eq(mentor_1[:active])
      expect(get_response[:data].first[:attributes][:program]).to eq(mentor_1[:program])

      expect(get_response[:data].first[:attributes][:preferences].first[:title]).to eq(mentor_1.preferences.first.title)

      expect(get_response[:data].second[:attributes][:name]).to eq(mentor_2[:name])

    end
  end
end
