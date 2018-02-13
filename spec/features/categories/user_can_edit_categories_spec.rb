require 'rails_helper'

describe "user can edit an existing category" do
  before(:each) do
    @adventure = Category.create!(name: "Adventure")
    @relax = Category.create!(name: "Relax")
    @volunteer = Category.create!(name: "Volunteer")
  end

  describe "they visit categories_path" do
    xit "they can edit a category" do
      visit categories_path

      click_on("Edit", match: :first)

      expect(current_path).to eq(edit_category_path(@adventure))
      fill_in("category[name]", with: "Action")
      click_on("Update Category")

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("Action")
      expect(page).to_not have_content("Adventure")
    end
  end

  describe "they visit category_path" do
    it "they can edit a category" do
      visit category_path(@adventure)

      click_on("Edit")

      fill_in("category[name]", with: "Action")
      click_on("Update Category")

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("Action")
      expect(page).to_not have_content("Adventure")
    end
  end
end
