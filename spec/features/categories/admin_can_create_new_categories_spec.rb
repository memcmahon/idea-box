require 'rails_helper'

describe "only admins can create a new category" do
  describe "as an admin they visit categories_path" do
    it "they can create a new category" do
      admin = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      fill_in("category[name]", with: "Cruise")
      click_on("Create Category")

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Success")
      expect(page).to have_content("Cruise")
    end
  end
end
