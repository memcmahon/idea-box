require 'rails_helper'

describe "user can create a new category" do
  describe "they visit categories_path" do
    it "they can create a new category" do
      visit categories_path

      fill_in("category[name]", with: "Cruise")
      click_on("Create Category")

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("Cruise")
    end
  end
end
