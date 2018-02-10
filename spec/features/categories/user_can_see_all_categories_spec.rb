require 'rails_helper'

describe "user can see a list of all categories" do
  describe "they visit categories_path" do
    it "they see all categories" do
      adventure = Category.create!(name: "Adventure")
      relax = Category.create!(name: "Relax")
      volunteer = Category.create!(name: "Volunteer")

      visit categories_path

      expect(page).to have content ("Categories")
      expect(page).to have content ("Adventure")
      expect(page).to have content ("Relax")
      expect(page).to have content ("Volunteer")
    end
  end
end
