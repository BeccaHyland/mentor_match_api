require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'students API' do
  describe 'GET /api/v1/students' do
    it 'returns all students in db' do
      user = User.create(name: "name_of_user", login: "xyz")
      token = Tokenator.encode(user.login)

      student_1 = Student.create(name: "test student 1", email: "test@email.com", slack_username: "test1")
      student_2 = Student.create(name: "test student 2", email: "test@contact.com", slack_username: "test2")

      get '/api/v1/students', params: {
        token: token
      }

      expect(response.status).to eq(200)

      get_response = JSON.parse(response.body, symbolize_names: true)

      expect(get_response[:data]).to be_an(Array)
      expect(get_response[:data].length).to eq(2)

      expect(get_response[:data].first[:attributes][:name]).to eq(student_1[:name])
      expect(get_response[:data].first[:attributes][:email]).to eq(student_1[:email])
      expect(get_response[:data].first[:attributes][:slack_username]).to eq(student_1[:slack_username])
      expect(get_response[:data].first[:attributes][:matched]).to eq(student_1[:matched])
      expect(get_response[:data].first[:attributes][:active]).to eq(student_1[:active])

      expect(get_response[:data].second[:attributes][:name]).to eq(student_2[:name])

    end
  end
end
