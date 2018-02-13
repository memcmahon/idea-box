require 'rails_helper'

describe "only admins can see category show" do
  before(:each) do
    @category_1 = Category.create!(name: "Adventure")
    @category_2 = Category.create!(name: "Relax")
    @category_3 = Category.create!(name: "Volunteer")
  end

  describe "as an admin they visit category index" do
    it "they can link to a category show page" do
      admin = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      click_on("Adventure")

      expect(current_path).to eq(admin_category_path(@category_1))
      expect(page).to have_content(@category_1.name)
      expect(page).to_not have_content(@category_2.name)
      expect(page).to_not have_content(@category_3.name)
    end
  end

  describe "as a regular user they visit category page" do
    it "they see an error message" do
      user = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit admin_category_path(@category_1)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
