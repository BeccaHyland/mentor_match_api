require 'rails_helper'

describe 'mentors API' do
  describe 'GET /api/v1/mentors/:id' do
    it 'returns a specific mentor from db' do
      mentor_1 = Mentor.create(name: "test mentor 1", email: "test@email.com", city: "Test City", state: "CO", slack_username: "test1")
      mentor_2 = Mentor.create(name: "test mentor 2", email: "test@contact.com", city: "Test Town", state: "CO", slack_username: "test2")

      mentor_1.preferences.create!(title: "veteran")
      mentor_1.preferences.create!(title: "female-identifying")
      mentor_2.preferences.create!(title: "parent")

      id = mentor_1.id
      #payload = { }

      get "/api/v1/mentors/#{id}"

      expect(response.status).to eq(200)

      get_response = JSON.parse(response.body, symbolize_names: true)
      expect(get_response[:data]).to be_a(Object)

      expect(get_response[:data][:attributes][:name]).to eq(mentor_1[:name])
      expect(get_response[:data][:attributes][:email]).to eq(mentor_1[:email])
      expect(get_response[:data][:attributes][:city]).to eq(mentor_1[:city])
      expect(get_response[:data][:attributes][:state]).to eq(mentor_1[:state])
      expect(get_response[:data][:attributes][:slack_username]).to eq(mentor_1[:slack_username])
      expect(get_response[:data][:attributes][:matched]).to eq(mentor_1[:matched])
      expect(get_response[:data][:attributes][:active]).to eq(mentor_1[:active])
      expect(get_response[:data][:attributes][:preferences].first[:title]).to eq(mentor_1.preferences.first.title)

    end
  end
end
