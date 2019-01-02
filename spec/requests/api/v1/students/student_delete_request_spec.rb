require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'student API endpoints' do
  describe 'DELETE request to /api/v1/student/:id' do
    describe 'as an admin' do
      it 'deletes a specific student from db' do
        user = User.create(name: "name_of_user", role: "admin", login: "xyz")
        token = Tokenator.encode(user.login)

        student_1 = create :student

        id = student_1.id
        student_count = Student.count
        expect(Student.find(id)).to be_valid

        delete "/api/v1/students/#{id}", params: {
          token: token
        }

        expect(response.status).to eq(204)
        new_student_count = student_count - 1
        expect(Student.count).to eq(new_student_count)
      end
    end
    describe 'as a non-admin' do
      it 'does not delete a student from the db' do
        #TBD
      end
    end
  end
end
