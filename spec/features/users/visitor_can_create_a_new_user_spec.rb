require 'rails_helper'

describe "visitor can create a user profile" do
  describe "they visit the root_path" do
    it "they can link to the new_user_path" do
      visit root_path

      expect(page).to have_content("Welcome to Travel Box")

      click_on("Sign Up")

      expect(current_path).to eq(new_user_path)
    end
  end

  describe "they visit new_user_path" do
    it "they can create a new user" do
      visit new_user_path

      fill_in("user[first_name]", with: "Jane")
      fill_in("user[last_name]", with: "Doe")
      fill_in("user[email]", with: "jane@fakemail.com")
      fill_in("user[password]", with: "test")
      fill_in("user[password_confirmation]", with: "test")
      click_on("Register")

      expect(current_path).to eq(user_path(User.last))
    end
  end
end
