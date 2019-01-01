require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'students API' do
  describe 'GET /api/v1/students/:id' do
    it 'returns a specific student from db' do
      user = User.create(name: "name_of_user", login: "xyz")
      token = Tokenator.encode(user.login)

      student_1 = Student.create(name: "test student 1", email: "test@email.com", slack_username: "test1")
      student_2 = Student.create(name: "test student 2", email: "test@contact.com", slack_username: "test2")

      id = student_1.id

      get "/api/v1/students/#{id}", params: {
        token: token
      }

      expect(response.status).to eq(200)

      get_response = JSON.parse(response.body, symbolize_names: true)
      expect(get_response[:data]).to be_a(Object)

      expect(get_response[:data][:attributes][:name]).to eq(student_1[:name])
      expect(get_response[:data][:attributes][:email]).to eq(student_1[:email])
      expect(get_response[:data][:attributes][:slack_username]).to eq(student_1[:slack_username])
      expect(get_response[:data][:attributes][:matched]).to eq(student_1[:matched])
      expect(get_response[:data][:attributes][:active]).to eq(student_1[:active])

    end
  end
end
