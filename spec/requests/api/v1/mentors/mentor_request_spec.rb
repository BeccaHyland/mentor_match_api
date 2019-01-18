require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'mentors API' do
  describe 'GET /api/v1/mentors/:id' do
    describe 'as an admin user' do
      it 'is not the correct endpoint for admin, returns limited attributes' do
        user = create(:user, role: "admin")
        token = Tokenator.encode(user.login)

        mentor_1 = create(:mentor)
        mentor_2 = create(:mentor)

        id = mentor_1.id

        get "/api/v1/mentors/#{id}", params: {
         token: token
        }

        expect(response.status).to eq(200)

        get_response = JSON.parse(response.body, symbolize_names: true)
        expect(get_response[:data]).to be_a(Object)

        expect(get_response[:data][:attributes][:identity_preference]).to eq(nil)
        expect(get_response[:data][:attributes][:mentee_capacity]).to eq(nil)

        expect(get_response[:data][:attributes][:name]).to eq(mentor_1[:name])
        expect(get_response[:data][:attributes][:email]).to eq(mentor_1[:email])
        expect(get_response[:data][:attributes][:city]).to eq(mentor_1[:city])
        expect(get_response[:data][:attributes][:state]).to eq(mentor_1[:state])
        expect(get_response[:data][:attributes][:country]).to eq(mentor_1[:country])
        expect(get_response[:data][:attributes][:slack_username]).to eq(mentor_1[:slack_username])
        expect(get_response[:data][:attributes][:matched]).to eq(mentor_1[:matched])
        expect(get_response[:data][:attributes][:active]).to eq(mentor_1[:active])
        expect(get_response[:data][:attributes][:pronouns]).to eq(mentor_1[:pronouns])
        expect(get_response[:data][:attributes][:current_title]).to eq(mentor_1[:current_title])
        expect(get_response[:data][:attributes][:current_employer]).to eq(mentor_1[:current_employer])
        expect(get_response[:data][:attributes][:background]).to eq(mentor_1[:background])
        expect(get_response[:data][:attributes][:stack_preference]).to eq(mentor_1[:stack_preference])
        expect(get_response[:data][:attributes][:industries]).to eq(mentor_1[:industries])
        expect(get_response[:data][:attributes][:ways_to_mentor]).to eq(mentor_1[:ways_to_mentor])
        expect(get_response[:data][:attributes][:expertise_tech]).to eq(mentor_1[:expertise_tech])
        expect(get_response[:data][:attributes][:expertise_non_tech]).to eq(mentor_1[:expertise_non_tech])
        expect(get_response[:data][:attributes][:stack_preference]).to eq(mentor_1[:stack_preference])
      end
    end

    describe 'as a non-admin user user id does NOT match requested mentor user_id' do
      it 'returns a specific mentor from db with LIMITED attributes' do
        user = create(:user, role: "user")
        token = Tokenator.encode(user.login)

        mentor_1 = create(:mentor)
        mentor_2 = create(:mentor)

        id = mentor_1.id

        get "/api/v1/mentors/#{id}", params: {
         token: token
        }

        expect(response.status).to eq(200)

        get_response = JSON.parse(response.body, symbolize_names: true)
        expect(get_response[:data]).to be_a(Object)

        expect(get_response[:data][:attributes][:identity_preference]).to eq(nil)
        expect(get_response[:data][:attributes][:mentee_capacity]).to eq(nil)

        expect(get_response[:data][:attributes][:name]).to eq(mentor_1[:name])
        expect(get_response[:data][:attributes][:email]).to eq(mentor_1[:email])
        expect(get_response[:data][:attributes][:city]).to eq(mentor_1[:city])
        expect(get_response[:data][:attributes][:state]).to eq(mentor_1[:state])
        expect(get_response[:data][:attributes][:country]).to eq(mentor_1[:country])
        expect(get_response[:data][:attributes][:slack_username]).to eq(mentor_1[:slack_username])
        expect(get_response[:data][:attributes][:matched]).to eq(mentor_1[:matched])
        expect(get_response[:data][:attributes][:active]).to eq(mentor_1[:active])
        expect(get_response[:data][:attributes][:pronouns]).to eq(mentor_1[:pronouns])
        expect(get_response[:data][:attributes][:current_title]).to eq(mentor_1[:current_title])
        expect(get_response[:data][:attributes][:current_employer]).to eq(mentor_1[:current_employer])
        expect(get_response[:data][:attributes][:background]).to eq(mentor_1[:background])
        expect(get_response[:data][:attributes][:stack_preference]).to eq(mentor_1[:stack_preference])
        expect(get_response[:data][:attributes][:industries]).to eq(mentor_1[:industries])
        expect(get_response[:data][:attributes][:ways_to_mentor]).to eq(mentor_1[:ways_to_mentor])
        expect(get_response[:data][:attributes][:expertise_tech]).to eq(mentor_1[:expertise_tech])
        expect(get_response[:data][:attributes][:expertise_non_tech]).to eq(mentor_1[:expertise_non_tech])
        expect(get_response[:data][:attributes][:stack_preference]).to eq(mentor_1[:stack_preference])
      end
    end

    describe 'as a non-admin user where user id matches requested mentor user_id' do
      it 'returns a specific mentor from db with ALL attributes' do
        user = create(:user, role: "user")
        token = Tokenator.encode(user.login)

        mentor_1 = create(:mentor, user_id: user.id)

        id = mentor_1.id

        get "/api/v1/mentors/#{id}", params: {
         token: token
        }

        expect(response.status).to eq(200)

        get_response = JSON.parse(response.body, symbolize_names: true)
        expect(get_response[:data]).to be_a(Object)

        expect(get_response[:data][:attributes][:identity_preference]).to eq(mentor_1[:identity_preference])
        expect(get_response[:data][:attributes][:mentee_capacity]).to eq(mentor_1[:mentee_capacity])

        expect(get_response[:data][:attributes][:name]).to eq(mentor_1[:name])
        expect(get_response[:data][:attributes][:email]).to eq(mentor_1[:email])
        expect(get_response[:data][:attributes][:city]).to eq(mentor_1[:city])
        expect(get_response[:data][:attributes][:state]).to eq(mentor_1[:state])
        expect(get_response[:data][:attributes][:country]).to eq(mentor_1[:country])
        expect(get_response[:data][:attributes][:slack_username]).to eq(mentor_1[:slack_username])
        expect(get_response[:data][:attributes][:matched]).to eq(mentor_1[:matched])
        expect(get_response[:data][:attributes][:active]).to eq(mentor_1[:active])
        expect(get_response[:data][:attributes][:pronouns]).to eq(mentor_1[:pronouns])
        expect(get_response[:data][:attributes][:current_title]).to eq(mentor_1[:current_title])
        expect(get_response[:data][:attributes][:current_employer]).to eq(mentor_1[:current_employer])
        expect(get_response[:data][:attributes][:background]).to eq(mentor_1[:background])
        expect(get_response[:data][:attributes][:stack_preference]).to eq(mentor_1[:stack_preference])
        expect(get_response[:data][:attributes][:industries]).to eq(mentor_1[:industries])
        expect(get_response[:data][:attributes][:ways_to_mentor]).to eq(mentor_1[:ways_to_mentor])
        expect(get_response[:data][:attributes][:expertise_tech]).to eq(mentor_1[:expertise_tech])
        expect(get_response[:data][:attributes][:expertise_non_tech]).to eq(mentor_1[:expertise_non_tech])
        expect(get_response[:data][:attributes][:stack_preference]).to eq(mentor_1[:stack_preference])
      end
    end
  end
end
