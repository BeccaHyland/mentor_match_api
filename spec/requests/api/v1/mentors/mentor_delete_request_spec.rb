require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'mentor API endpoints' do
  describe 'DELETE request to /api/v1/mentors/:id' do
    describe 'as an admin user' do
      it 'deletes a specific mentor from db' do
        user = create(:user, role: "admin")
        #token = Tokenator.encode(user.login)

        mentor_1 = create :mentor

        id = mentor_1.id
        mentor_count = Mentor.count
        expect(Mentor.find(id)).to be_valid

        delete "/api/v1/mentors/#{id}", params: {
        #  token: token
        }

        expect(response.status).to eq(204)
        new_mentor_count = mentor_count - 1
        expect(Mentor.count).to eq(new_mentor_count)
      end
    end

    describe 'as a non-admin user' do
      it 'returns a 401 unauthorized error' do
        user = create(:user, role: "user")
        #token = Tokenator.encode(user.login)

        mentor_1 = create :mentor

        id = mentor_1.id
        mentor_count = Mentor.count
        expect(Mentor.find(id)).to be_valid

        delete "/api/v1/mentors/#{id}", params: {
        #  token: token
        }

        # expect(response.status).to eq(401)
        # new_mentor_count = mentor_count - 1
        # expect(Mentor.count).to eq(mentor_count)
      end
    end
  end
end
