require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'admin student_mentors API' do
  describe 'GET /api/v1/admin/student_mentors' do
    describe 'as an admin user' do
      it 'returns all student_mentors in db' do
        user = User.create(name: "name_of_user", role: "admin", login: "xyz")
        token = Tokenator.encode(user.login)

        students = create_list(:student, 4)
        mentors = create_list(:mentor, 2)

        mentor_1 = mentors[0]
        mentor_2 = mentors[1]

        student_1 = students[0]
        student_2 = students[1]
        student_3 = students[2]
        student_4 = students[3]

        student_mentor_1 = StudentMentor.create(student_id: student_1.id, mentor_id: mentor_1.id, active: true)
        student_mentor_2 = StudentMentor.create(student_id: student_2.id, mentor_id: mentor_1.id, active: true)
        student_mentor_3 = StudentMentor.create(student_id: student_3.id, mentor_id: mentor_2.id, active: true)
        student_mentor_4 = StudentMentor.create(student_id: student_4.id, mentor_id: mentor_2.id, active: true)

        get '/api/v1/admin/student_mentors', params: {}, headers: {'Authorization': token}

        expect(response.status).to eq(200)

        get_response = JSON.parse(response.body, symbolize_names: true)

        expect(get_response[:data]).to be_an(Array)
        expect(get_response[:data].length).to eq(4)

        expect(get_response[:data].first[:attributes][:student_id]).to eq(student_1[:id])
        expect(get_response[:data].first[:attributes][:mentor_id]).to eq(mentor_1[:id])
        expect(get_response[:data].first[:attributes][:active]).to eq(student_mentor_1[:active])
      end
    end
    describe 'as a non-admin user' do
      it 'does not return student_mentors in db' do
        user = User.create(name: "name_of_user", login: "xyz")
        token = Tokenator.encode(user.login)

        students = create_list(:student, 4)
        mentors = create_list(:mentor, 2)

        mentor_1 = mentors[0]
        mentor_2 = mentors[1]

        student_1 = students[0]
        student_2 = students[1]
        student_3 = students[2]
        student_4 = students[3]


        student_mentor_1 = StudentMentor.create(student_id: student_1.id, mentor_id: mentor_1.id, active: true)
        student_mentor_2 = StudentMentor.create(student_id: student_2.id, mentor_id: mentor_1.id, active: true)
        student_mentor_3 = StudentMentor.create(student_id: student_3.id, mentor_id: mentor_2.id, active: true)
        student_mentor_4 = StudentMentor.create(student_id: student_4.id, mentor_id: mentor_2.id, active: true)

        student_mentor_count = StudentMentor.all.count

        get '/api/v1/admin/student_mentors', params: {}, headers: {'Authorization': token}

        expect(response.status).to eq(401)
      end
    end
  end
end
