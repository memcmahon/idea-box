require 'rails_helper'

describe "only admins can edit an existing category" do
  before(:each) do
    @category = Category.create!(name: "Adventure")
  end

  describe "as an admin they visit categories_path" do
    it "they can edit a category" do
      admin = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      click_on("Edit", match: :first)

      expect(current_path).to eq(edit_admin_category_path(@category))
      fill_in("category[name]", with: "Action")
      click_on("Update Category")

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Action")
      expect(page).to_not have_content("Adventure")
    end
  end

  describe "as an admin they visit category_path" do
    it "they can edit a category" do
      admin = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_category_path(@category)

      click_on("Edit")

      fill_in("category[name]", with: "Action")
      click_on("Update Category")

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Action")
      expect(page).to_not have_content("Adventure")
    end
  end

  describe "as a regular user they visit edit category page" do
    it "they see an error message" do
      user = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_admin_category_path(@category)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
