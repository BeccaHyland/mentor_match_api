require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'mentors API' do
  describe 'GET /api/v1/mentors' do
    describe 'as an admin user with a token' do
      it 'returns all mentors in db, each with ALL attributes' do
        user = create(:user, role: "admin")
        token = Tokenator.encode(user.login)

        mentor_1 = create(:mentor)
        mentor_2 = create(:mentor)

        get '/api/v1/admin/mentors', params: {
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
        expect(get_response[:data].first[:attributes][:country]).to eq(mentor_1[:country])
        expect(get_response[:data].first[:attributes][:slack_username]).to eq(mentor_1[:slack_username])
        expect(get_response[:data].first[:attributes][:matched]).to eq(mentor_1[:matched])
        expect(get_response[:data].first[:attributes][:active]).to eq(mentor_1[:active])
        expect(get_response[:data].first[:attributes][:pronouns]).to eq(mentor_1[:pronouns])
        expect(get_response[:data].first[:attributes][:current_title]).to eq(mentor_1[:current_title])
        expect(get_response[:data].first[:attributes][:current_employer]).to eq(mentor_1[:current_employer])
        expect(get_response[:data].first[:attributes][:background]).to eq(mentor_1[:background])
        expect(get_response[:data].first[:attributes][:stack_preference]).to eq(mentor_1[:stack_preference])
        expect(get_response[:data].first[:attributes][:industries]).to eq(mentor_1[:industries])
        expect(get_response[:data].first[:attributes][:ways_to_mentor]).to eq(mentor_1[:ways_to_mentor])
        expect(get_response[:data].first[:attributes][:expertise_tech]).to eq(mentor_1[:expertise_tech])
        expect(get_response[:data].first[:attributes][:expertise_non_tech]).to eq(mentor_1[:expertise_non_tech])
        expect(get_response[:data].first[:attributes][:stack_preference]).to eq(mentor_1[:stack_preference])
        expect(get_response[:data].first[:attributes][:identity_preference]).to eq(mentor_1[:identity_preference])
        expect(get_response[:data].first[:attributes][:mentee_capacity]).to eq(mentor_1[:mentee_capacity])

        expect(get_response[:data].second[:attributes][:name]).to eq(mentor_2[:name])
      end
    end

    describe 'as an admin user without a token' do
      it 'returns a 401' do
        user = create(:user, role: "admin")

        mentor_1 = create(:mentor)
        mentor_2 = create(:mentor)

        get '/api/v1/admin/mentors', params: {}

        expect(response.status).to eq(401)
      end
    end

    describe 'as a non-admin user' do
      it 'returns a 401' do
        user = create(:user, role: "user")
        token = Tokenator.encode(user.login)

        mentor_1 = create(:mentor)
        mentor_2 = create(:mentor)

        get '/api/v1/admin/mentors', params: {
         token: token
        }

        expect(response.status).to eq(401)
      end
    end
  end
end
