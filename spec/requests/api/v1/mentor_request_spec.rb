require 'rails_helper'

describe 'mentors API' do
  describe 'GET /api/v1/mentors/:id' do
    it 'returns a specific mentor from db' do
    mentor_1, mentor_2, mentor_3 = create_list(:mentor, 3)

      #payload = { }

      get '/api/v1/mentors/1'

      expect(response.status).to eq(200)

      get_response = JSON.parse(response.body, symbolize_names: true)
      expect(get_response[:data]).to be_a(Object)

      expect(get_response[:data][:attributes][:name]).to eq(mentor_1[:name])
      expect(get_response[:data][:attributes][:email]).to eq(mentor_1[:email])
      expect(get_response[:data][:attributes][:city]).to eq(mentor_1[:city])
      expect(get_response[:data][:attributes][:state]).to eq(mentor_1[:state])
      expect(get_response[:data][:attributes][:slack_username]).to eq(mentor_1[:slack_username])
      expect(get_response[:data][:attributes][:linkedin_username]).to eq(mentor_1[:linkedin_username])
      expect(get_response[:data][:attributes][:github_username]).to eq(mentor_1[:github_username])
      expect(get_response[:data][:attributes][:matched]).to eq(mentor_1[:matched])
      expect(get_response[:data][:attributes][:active]).to eq(mentor_1[:active])
      expect(get_response[:data][:attributes][:program]).to eq(mentor_1[:program])

    end
  end
end