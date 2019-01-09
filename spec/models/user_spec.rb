require  'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:role)}
    it {should validate_presence_of(:login)}
    it {should validate_uniqueness_of(:login)}
  end

  describe 'associations' do
    # it {should have_one(:mentor)}
  end
end
