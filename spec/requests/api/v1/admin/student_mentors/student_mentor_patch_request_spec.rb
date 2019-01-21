require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'admin student_mentors API' do
  describe 'PATCH /api/v1/admin/student_mentors/:id' do
    describe 'as an admin user' do
      it 'patches successfully to /api/v1/admin/student_mentors/:id' do
        user = create(:user, role: "admin")
        token = Tokenator.encode(user.login)

        student_1 = create(:student)
        student_2 = create(:student)
        mentor_1 = create(:mentor)
        mentor_2 = create(:mentor)

        id = StudentMentor.create!(student_id: student_1.id, mentor_id: mentor_1.id).id
        previous_student_id = StudentMentor.last.student_id
        previous_mentor_id = StudentMentor.last.mentor_id
        previous_active = StudentMentor.last.active

        payload = {
          student_id: student_2.id,
          mentor_id: mentor_2.id,
          active: false
        }

        patch "/api/v1/admin/student_mentors/#{id}", params: {
          student_mentor: payload
        },
        headers: {
          'Authorization': token
        }

        student_mentor = StudentMentor.find_by_id(id)

        expect(response.status).to eq(200)

        expect(student_mentor.student_id).to_not eq(previous_student_id)
        expect(student_mentor.mentor_id).to_not eq(previous_mentor_id)
        expect(student_mentor.active).to_not eq(previous_active)
        expect(student_mentor.student_id).to eq(payload[:student_id])
        expect(student_mentor.mentor_id).to eq(payload[:mentor_id])
        expect(student_mentor.active).to eq(payload[:active])
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

        patch "/api/v1/admin/student_mentors/#{id}", params: {
          mentor: payload
        },
        headers: {
          'Authorization': token_1
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
