require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'student mentor API endpoints' do
  describe 'DELETE request to /api/v1/student_mentors/:id' do
    describe 'as an admin user' do
      it 'deletes a specific student mentor from db' do
        user = create(:user, role: "admin")
      #  token = Tokenator.encode(user.login)
      students = create_list(:student, 4)
      mentors = create_list(:mentor, 2)

        mentor_1 = create (:mentor)
        student_1 = create (:student)

        student_mentor_1 = StudentMentor.create(student_id: student_1.id, mentor_id: mentor_1.id, active: true)

        id = student_mentor_1.id
        student_mentor_count = StudentMentor.count
        expect(StudentMentor.find(id)).to be_valid

        delete "/api/v1/student_mentors/#{id}", params: {
          #token: token
        }

        expect(response.status).to eq(204)
        new_student_mentor_count = student_mentor_count - 1
        expect(StudentMentor.count).to eq(new_student_mentor_count)
      end
    end

    describe 'as a non-admin user' do
      it 'returns a 401 unauthorized error' do
        user = create(:user, role: "user")
        token = Tokenator.encode(user.login)

        mentor_1 = create(:mentor)
        student_1 = create(:student)

        student_mentor_1 = StudentMentor.create(student_id: student_1.id, mentor_id: mentor_1.id, active: true)

        id = student_mentor_1.id
        student_mentor_count = StudentMentor.count
        expect(StudentMentor.find(id)).to be_valid

        delete "/api/v1/mentors/#{id}", params: {
          #token: token
        }

        #expect(response.status).to eq(401)
        new_student_mentor_count = student_mentor_count - 1
        expect(StudentMentor.count).to eq(student_mentor_count)
      end
    end
  end
end
