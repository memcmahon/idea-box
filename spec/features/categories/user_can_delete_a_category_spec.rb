require 'rails_helper'

describe "user can delete an existing category" do
  before(:each) do
    @adventure = Category.create!(name: "Adventure")
    @relax = Category.create!(name: "Relax")
    @volunteer = Category.create!(name: "Volunteer")
  end

  describe "they visit categories_path" do
    xit "they can delete a category" do
      visit categories_path

      click_on("Delete", match: :first)

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("Relax")
      expect(page).to have_content("Volunteer")
      expect(page).to_not have_content("Adventure")
    end
  end

  describe "they visit category_path" do
    it "they can delete a category" do
      visit category_path(@adventure)

      click_on("Delete")

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("Relax")
      expect(page).to have_content("Volunteer")
      expect(page).to_not have_content("Adventure")
    end
  end
end
