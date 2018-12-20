require 'rails_helper'

RSpec.describe MentorPreference, type: :model do
  describe 'relationships' do
    it {should belong_to(:preference)}
    it {should belong_to(:mentor)}
  end
end