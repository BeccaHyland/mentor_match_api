require 'rails_helper'

describe 'mentors API' do
  describe 'GET /api/v1/mentors' do
    it 'returns all mentors in db' do
    mentor_1, mentor_2, mentor_3 = create_list(:mentor, 3)

      #payload = { }

      get '/api/v1/mentors'

      expect(response.status).to eq(200)

      get_response = JSON.parse(response.body, symbolize_names: true)

      expect(get_response[:data]).to be_an(Array)
      expect(get_response[:data].length).to eq(3)
      expect(get_response[:data].first[:attributes][:name]).to eq(mentor_1[:name])

    end
  end
end