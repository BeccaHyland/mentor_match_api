require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'mentors API' do
  describe 'PATCH /api/v1/mentors/:id' do
    describe 'as an admin user' do
      it 'returns a 401' do
        user = create(:user, role: "admin")
        token = Tokenator.encode(user.login)

        id = create(:mentor).id
        previous_name = Mentor.last.name
        previous_email = Mentor.last.email
        previous_matched = Mentor.last.matched

        payload = {
          name: "Douglas Adams",
          email: "forty_two@gmail.com",
          matched: true
        }

        patch "/api/v1/mentors/#{id}", params: {
          mentor: payload,
         token: token
        }

        mentor = Mentor.find_by_id(id)

        expect(response.status).to eq(401)

        expect(mentor.name).to eq(previous_name)
        expect(mentor.email).to eq(previous_email)
        expect(mentor.matched).to eq(previous_matched)
        expect(mentor.name).to_not eq(payload[:name])
        expect(mentor.email).to_not eq(payload[:email])
        expect(mentor.matched).to_not eq(payload[:matched])
      end
    end

    describe 'as a non-admin user whose id matches the request' do
      it 'patches successfully to /api/v1/mentors/:id' do
        user = create(:user)
        token = Tokenator.encode(user.login)

        extra_mentor_to_throw_off_id_count_within_test = create(:mentor)
        mentor_requesting_update = create(:mentor, user_id: user.id)
        id = mentor_requesting_update.id

        previous_name = Mentor.last.name
        previous_email = Mentor.last.email
        previous_matched = Mentor.last.matched

        payload = {
          name: "Douglas Adams",
          email: "forty_two@gmail.com",
          matched: true
        }

        patch "/api/v1/mentors/#{id}", params: {
          mentor: payload,
         token: token
        }

        mentor = Mentor.find_by_id(id)

        expect(response.status).to eq(200)

        expect(mentor.name).to_not eq(previous_name)
        expect(mentor.email).to_not eq(previous_email)
        expect(mentor.matched).to_not eq(previous_matched)
        expect(mentor.name).to eq(payload[:name])
        expect(mentor.email).to eq(payload[:email])
        expect(mentor.matched).to eq(payload[:matched])
      end
    end

    describe 'as a non-admin user whose id does not match the request' do
      it 'returns a 401 unauthorized error' do
        user_1 = create(:user)
        token_1 = Tokenator.encode(user_1.login)
        user_2 = create(:user)
        token_2 = Tokenator.encode(user_2.login)

        mentor_requesting_update = create(:mentor, user_id: user_2.id)
        id = mentor_requesting_update.id

        previous_name = Mentor.last.name
        previous_email = Mentor.last.email
        previous_matched = Mentor.last.matched

        payload = {
          name: "Douglas Adams",
          email: "forty_two@gmail.com",
          matched: true
        }

        patch "/api/v1/mentors/#{id}", params: {
          mentor: payload,
          token: token_1
        }

        mentor = Mentor.find_by_id(id)

        expect(response.status).to eq(401)

        expect(mentor.name).to eq(previous_name)
        expect(mentor.email).to eq(previous_email)
        expect(mentor.matched).to eq(previous_matched)
        expect(mentor.name).to_not eq(payload[:name])
        expect(mentor.email).to_not eq(payload[:email])
        expect(mentor.matched).to_not eq(payload[:matched])
      end
    end
  end
end
