require 'rails_helper'

describe "user can create a new idea" do
  before(:each) do
    @user = User.create!(first_name: "Jane", last_name: "Doe", email: "janefake.com", password: "password!")
    @category_1 = Category.create!(name: "Adventure")
    @category_2 = Category.create!(name: "Relax")
  end

  describe "user visits user_ideas_path" do
    it "they can create a new idea" do
      visit user_ideas_path(@user)

      click_on("New Idea")

      fill_in("idea[title]", with: "Heli-Ski Alaska")
      fill_in("idea[content]", with: "Lets shred in AK!")
      select("Adventure", :from => "idea[category_id]")
      click_on("Create Idea")

      expect(current_path).to eq(user_idea_path(@user, Idea.last))
      expect(page).to have_content("Heli-Ski Alaska")
      expect(page).to have_content("Lets shred in AK!")
      expect(page).to have_content("Adventure")
      expect(page).to_not have_content("Spa Weekend")
      expect(page).to_not have_content("Relax")
    end
  end
end
