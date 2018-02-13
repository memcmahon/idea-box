require 'rails_helper'

describe "admins can delete an existing category" do
  before(:each) do
    @category_1 = Category.create!(name: "Adventure")
    @category_2 = Category.create!(name: "Relax")
    @category_3 = Category.create!(name: "Volunteer")
  end

  describe "as an admin they visit categories_path" do
    it "they can delete a category" do
      admin = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      click_on("Delete", match: :first)

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content(@category_3.name)
      expect(page).to have_content(@category_2.name)
      expect(page).to_not have_content(@category_1.name)
    end
  end

  describe "they visit category_path" do
    it "they can delete a category" do
      admin = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_category_path(@category_1)

      click_on("Delete")

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content(@category_3.name)
      expect(page).to have_content(@category_2.name)
      expect(page).to_not have_content(@category_1.name)
    end
  end
end
