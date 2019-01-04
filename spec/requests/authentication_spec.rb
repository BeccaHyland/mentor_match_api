require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'Authenticator Requests' do
  it 'has route to /auth/github' do

    get '/auth/github'

    expect(response.status).to eq(302)
  end
end
