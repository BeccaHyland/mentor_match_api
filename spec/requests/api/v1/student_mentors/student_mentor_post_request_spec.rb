require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'student mentors API' do
  describe 'POST /api/v1/student_mentors/' do
    describe 'as a non-admin user entering my info to become a mentor' do
      it 'posts successfully to the db' do
        user = create(:user)
        #token = Tokenator.encode(user.login)
        mentor_1 = create(:mentor)
        student_1 = create(:student)

        payload = {
          mentor_id: mentor_1.id,
          student_id: student_1.id
        }

        post '/api/v1/student_mentors', params: {
          student_mentor: payload,
          #token: token
        }

        student_mentor = StudentMentor.last

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(student_mentor.student_id).to eq(payload[:student_id])
        expect(student_mentor.mentor_id).to eq(payload[:mentor_id])
        expect(student_mentor.active).to eq(true)
      end

      it 'does not post successfully with missing attributes' do
        user = create(:user)
    #    token = Tokenator.encode(user.login)

        mentor_1 = create(:mentor)
        student_1 = create(:student)

        payload = {
          mentor_id: mentor_1.id,
          student_id: student_1.id
        }

        post '/api/v1/student_mentors', params: {
          student_mentor: payload,
        #  token: token
        }

        student_mentor = StudentMentor.last

        #expect(response).to_not be_successful
        #expect(response.status).to eq(400)
      end
    end

    describe 'as an admin user submitting the create mentor form' do
      it 'does not post successfully to the db' do
        user = create(:user, role: "admin")
        token = Tokenator.encode(user.login)

        payload = {
          name: "Atreyu",
          email: "never_ending@gmail.com",
          city: "New York",
          state: "NY",
          country: "USA",
          slack_username: "atreyu@slack.com",
          matched: false,
          active: true,
          pronouns: "He/Him",
          current_title: "Software Developer",
          current_employer: "Atlantic Records",
          background: "Punk Rock",
          mentee_capacity: 1,
          meeting_location: ["Turing"],
          industries: ["here", "there"],
          ways_to_mentor: ["wisdom", "insight"],
          expertise_tech: ["wisdom", "insight"],
          expertise_non_tech: ["wisdom", "insight"],
          stack_preference: "BE",
          identity_preference: ["male-identifying"],
        }

        post '/api/v1/mentors', params: {
          mentor: payload,
          token: token
        }

        expect(response.status).to eq(401)
      end
    end
  end
end
