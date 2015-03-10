require 'rails_helper'

feature 'User signs in' do
  background do
    visit root_path
    fill_in "username", with: "John"
  end

  scenario 'with valid inputs' do
    select "Pirate", from: "dialect"
    click_button "Log In"
    expect(page).to have_content("John")
  end

  scenario "with invalid inputs" do
    click_button "Log In"
    expect(page).to_not have_content("John")
  end
end
