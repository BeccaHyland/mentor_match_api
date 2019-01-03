require 'rails_helper'

describe 'as a visitor to the Mentor Match API root URL' do
  it 'displays a welcome page with project info' do
    visit welcome_path

    expect(page).to have_content("Weclome to Mentor Match")
    expect(page).to have_content("Visit the app's Front End")
  end
end
