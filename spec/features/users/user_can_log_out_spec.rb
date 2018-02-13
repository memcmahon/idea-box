require 'rails_helper'

describe "user can log out" do
  describe "they visit their user page" do
    it "they can log out" do
      user = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test")
      visit root_path
      click_on "Log In"
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Log In"

      click_on "Log Out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome to Travel Box")
    end
  end
end
