require 'rails_helper'

RSpec.describe Preference, type: :model do
  describe 'validations' do
    it {should validate_presence_of (:title)}
  end
  it 'exists' do
    preference = Preference.new()
    expect(preference).to be_a(Preference)
  end
  it 'has attributes' do
    title = "parent"

    attributes = {
      title: "parent"
    }

    preference = Preference.new(attributes)

    expect(preference.title).to eq(title)
  end
  describe 'relationships' do
    it {should have_many(:mentors)}
    it {should have_many(:mentor_preferences)}
  end
end