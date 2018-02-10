require 'rails_helper'

describe "user sees one category" do
  before(:each) do
    @adventure = Category.create!(name: "Adventure")
    @relax = Category.create!(name: "Relax")
    @volunteer = Category.create!(name: "Volunteer")
  end

  describe "they visit category index" do
    it "they can link to a category show page" do
      visit categories_path

      click_on("Adventure")

      expect(current_path).to eq(category_path(@adventure))
      expect(page).to have_content("Adventure")
      expect(page).to_not have_content("Relax")
    end
  end
end
