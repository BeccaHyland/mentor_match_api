require 'rails_helper'

describe "Authenticator class" do
  describe '#github' do
    it 'contacts GitHub' do

      authenticator = Authenticator.new
      test_code = "1234"

      user_info_hash = {
        issuer: ENV['MENTOR_MATCH_CLIENT_URL'],
        login: "test login string",
        name: "test name string",
        avatar_url: "test_avatar_url_string"
      }

      allow(authenticator).to receive(:github).and_return(user_info_hash)

      response = authenticator.github(test_code)

      expect(response).to eq(user_info_hash)
    end
  end
end
