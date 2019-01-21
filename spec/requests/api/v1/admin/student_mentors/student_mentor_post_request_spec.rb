require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'admin student mentors API' do
  describe 'POST /api/v1/admin/student_mentors/' do
    describe 'as an admin user matching a student to a mentor' do
      it 'posts successfully to the db' do
        user = create(:user, role: "admin")
        token = Tokenator.encode(user.login)
        mentor_1 = create(:mentor)
        student_1 = create(:student)

        payload = {
          mentor_id: mentor_1.id,
          student_id: student_1.id
        }

        post '/api/v1/admin/student_mentors', params: {
          student_mentor: payload
        },
        headers: {
          'Authorization': token
        }

        student_mentor = StudentMentor.last

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(student_mentor.student_id).to eq(payload[:student_id])
        expect(student_mentor.mentor_id).to eq(payload[:mentor_id])
        expect(student_mentor.active).to eq(true)
      end

      it 'does not post successfully with missing attributes' do
        user = create(:user, role: "admin")
        token = Tokenator.encode(user.login)

        mentor_1 = create(:mentor)
        student_1 = create(:student)

        payload = {
          mentor_id: mentor_1.id,
        }

        post '/api/v1/admin/student_mentors', params: {
          student_mentor: payload
        },
        headers: {
          'Authorization': token
        }

        student_mentor = StudentMentor.last

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
      end
    end

    describe 'as a non-admin user matching a student to a mentor' do
      it 'returns a 401' do
        user = create(:user)
        token = Tokenator.encode(user.login)
        mentor_1 = create(:mentor)
        student_1 = create(:student)

        payload = {
          mentor_id: mentor_1.id,
          student_id: student_1.id
        }

        post '/api/v1/admin/student_mentors', params: {
          student_mentor: payload
        },
        headers: {
          'Authorization': token
        }

        expect(response.status).to eq(401)
      end
    end
  end
end
