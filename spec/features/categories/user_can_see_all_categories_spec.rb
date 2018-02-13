require 'rails_helper'

describe "users can see a list of all categories" do
  describe "as an admin they visit categories_path" do
    it "they see all categories" do
      admin = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)
      category_1 = Category.create!(name: "Adventure")
      category_2 = Category.create!(name: "Relax")
      category_3 = Category.create!(name: "Volunteer")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content("Categories")
      expect(page).to have_content(category_1.name)
      expect(page).to have_content(category_2.name)
      expect(page).to have_content(category_3.name)
    end
  end

  describe "as regular user they visit categories_path" do
    it "they see an error message categories" do
      user = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test")
      category_1 = Category.create!(name: "Adventure")
      category_2 = Category.create!(name: "Relax")
      category_3 = Category.create!(name: "Volunteer")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
