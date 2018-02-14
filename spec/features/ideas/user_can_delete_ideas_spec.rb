require 'rails_helper'

describe "user can delete ideas" do
  before(:each) do
    @jane = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fake.com", password: "password!")
    @category = Category.create!(name: "Adventure")
    @idea_1 = @jane.ideas.create!(title: "Heli-Ski Alaska", content: "lets go heliskiing in AK.", category: @category)
    @idea_2 = @jane.ideas.create!(title: "Boulder Virgin Gorda", content: "lets boulder in virgin gorda!", category: @category)
  end

  describe "they visit user_ideas_path" do
    xit "they can delete an idea" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@jane)

      visit user_ideas_path(@jane)

      click_on("Delete", match: :first)

      expect(page).to have_content("Boulder Virgin Gorda")
      expect(page).to_not have_content("Heli-Ski Alaska")
    end
  end

  describe "they visit user_idea_path" do
    xit "they can delete that idea" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit user_idea_path(@user, @idea_1)

      click_on("Delete")

      expect(page).to have_content("Boulder Virgin Gorda")
      expect(page).to_not have_content("Heli-Ski Alaska")
    end
  end
end
