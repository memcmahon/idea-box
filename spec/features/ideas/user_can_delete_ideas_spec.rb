require 'rails_helper'

describe "user can delete ideas" do
  before(:each) do
    @user = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fake.com", password: "password!")
    @category = Category.create!(name: "Adventure")
    @idea_1 = @user.ideas.create!(title: "Heli-Ski Alaska", content: "lets go heliskiing in AK.", category: @category)
    @idea_2 = @user.ideas.create!(title: "Boulder Virgin Gorda", content: "lets boulder in virgin gorda!", category: @category)
  end

  describe "they visit user_ideas_path" do
    it "they can delete an idea" do
      visit user_ideas_path(@user)

      click_on("Delete", match: :first)

      expect(page).to have_content("Boulder Virgin Gorda")
      expect(page).to_not have_content("Heli-Ski Alaska")
    end
  end

  describe "they visit user_idea_path" do
    it "they can delete that idea" do
      visit user_ideas_path(@user, @idea_1)

      click_on("Delete")

      expect(page).to have_content("Boulder Virgin Gorda")
      expect(page).to_not have_content("Heli-Ski Alaska")
    end
  end
end
