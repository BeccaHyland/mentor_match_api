require 'rails_helper'
require './lib/tokenator.rb'
include Tokenator

describe 'Tokenator Module' do
  it 'exists' do
    token = "123"
    tokenator = Tokenator.encode(token)
  end
  it 'has methods' do
    token = "12343"
    encoded = Tokenator.encode(token)
    Tokenator.decode(encoded)
  end
end
