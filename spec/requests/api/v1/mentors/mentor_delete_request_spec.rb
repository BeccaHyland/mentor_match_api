require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'mentor API endpoints' do
  describe 'DELETE request to /api/v1/mentors/:id' do
    it 'deletes a specific mentor from db' do
      user = User.create(name: "name_of_user", login: "xyz")
      token = Tokenator.encode(user.login)

      mentor_1 = create :mentor

      id = mentor_1.id
      mentor_count = Mentor.count
      expect(Mentor.find(id)).to be_valid

      delete "/api/v1/mentors/#{id}", params: {
        token: token
      }

      expect(response.status).to eq(204)
      new_mentor_count = mentor_count - 1
      expect(Mentor.count).to eq(new_mentor_count)
    end
  end
end
