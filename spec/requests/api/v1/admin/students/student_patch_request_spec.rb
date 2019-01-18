require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'admin students API' do
  describe 'PATCH /api/v1/admin/students/:id' do
    describe 'as an admin' do
      it 'patches successfully to /api/v1/admin/students/:id' do
        user = User.create(name: "name_of_user", role: "admin", login: "xyz")
        token = Tokenator.encode(user.login)

        id = create(:student).id
        previous_name = Student.last.name
        previous_email = Student.last.email
        previous_matched = Student.last.matched

        payload = {
          name: "Douglas Adams",
          email: "forty_two@gmail.com",
          matched: true
        }

        patch "/api/v1/admin/students/#{id}", params: {
          student: payload,
          token: token
        }

        student = Student.find_by_id(id)

        expect(response.status).to eq(200)

        expect(student.name).to_not eq(previous_name)
        expect(student.email).to_not eq(previous_email)
        expect(student.matched).to_not eq(previous_matched)
        expect(student.name).to eq(payload[:name])
        expect(student.email).to eq(payload[:email])
        expect(student.matched).to eq(payload[:matched])
      end
    end
    describe 'as a non admin' do
      it 'does not patch successfully to /api/v1/admin/students/:id' do
        user = User.create(name: "name_of_user", role: "user", login: "xyz")
        token = Tokenator.encode(user.login)

        id = create(:student).id
        previous_name = Student.last.name
        previous_email = Student.last.email
        previous_matched = Student.last.matched

        payload = {
          name: "Douglas Adams",
          email: "forty_two@gmail.com",
          matched: true
        }

        patch "/api/v1/admin/students/#{id}", params: {
          student: payload,
          token: token
        }

        student = Student.find_by_id(id)

        expect(response.status).to eq(401)

        expect(student.name).to eq(previous_name)
        expect(student.email).to eq(previous_email)
        expect(student.matched).to eq(previous_matched)
        expect(student.name).to_not eq(payload[:name])
        expect(student.email).to_not eq(payload[:email])
        expect(student.matched).to_not eq(payload[:matched])
      end
    end
  end
end
