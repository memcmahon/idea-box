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
end
