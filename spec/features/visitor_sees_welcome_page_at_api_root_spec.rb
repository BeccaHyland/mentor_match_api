require 'rails_helper'

describe 'as a visitor to the Mentor Match API root URL' do
  it 'displays a welcome page with project info' do
    visit "/"

    expect(page).to have_content("Welcome to the Mentor Match API")
    expect(page).to have_content("To use this API, see documentation here.")
  end
end
