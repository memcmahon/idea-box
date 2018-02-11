require 'rails_helper'

describe "user can edit an idea" do
  before(:each) do
    @user = User.create!(first_name: "Jane", last_name: "Doe", email: "janefake.com", password: "password!")
    @category_1 = Category.create!(name: "Adventure")
    @category_2 = Category.create!(name: "Relax")
    @idea_1 = @user.ideas.create!(title: "Heli-Ski Alaska", content: "lets go heliskiing in AK.", category: @category_1)
    @idea_2 = @user.ideas.create!(title: "Boulder Virgin Gorda", content: "lets boulder in virgin gorda!", category: @category_1)
  end

  describe "user visits user_idea_path" do
    it "they can edit that idea" do
      visit user_idea_path(@user, @idea_1)

      click_on("Edit")

      fill_in("idea[title]", with: "Spa Weekend")
      fill_in("idea[content]", with: "I need a massage!")
      select("Relax", :from => "idea[category_id]")
      click_on("Update Idea")

      expect(page).to have_content("Spa Weekend")
      expect(page).to have_content("I need a massage!")
      expect(page).to have_content("Relax")
      expect(page).to_not have_content("Heli-Ski Alaska")
      expect(page).to_not have_content("Adventure")
    end
  end
end
