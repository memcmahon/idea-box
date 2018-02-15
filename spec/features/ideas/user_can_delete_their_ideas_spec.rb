require 'rails_helper'

describe "user can delete ideas" do
  describe "they visit user_ideas_path" do
    it "they can delete an idea" do
      user = User.create!(first_name: "Jane", last_name: "Doe", email: "janefake.com", password: "password!")
      category = Category.create!(name: "Adventure")
      idea_1 = Idea.create!(user: user, title: "Heli-Ski Alaska", content: "lets go heliskiing in AK.", category: category)
      idea_2 = Idea.create!(user: user, title: "Boulder Virgin Gorda", content: "lets boulder in virgin gorda!", category: category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_ideas_path(user)

      click_on("Delete", match: :first)

      expect(page).to have_content("Boulder Virgin Gorda")
      expect(page).to_not have_content("Heli-Ski Alaska")
    end
  end

  describe "they visit user_idea_path" do
    it "they can delete that idea" do
      user = User.create!(first_name: "Jane", last_name: "Doe", email: "janefake.com", password: "password!")
      category = Category.create!(name: "Adventure")
      idea_1 = user.ideas.create(title: "Heli-Ski Alaska", content: "lets go heliskiing in AK.", category: category)
      idea_2 = user.ideas.create(title: "Boulder Virgin Gorda", content: "lets boulder in virgin gorda!", category: category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_idea_path(user, idea_1)


      click_on("Delete")

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to have_content("Boulder Virgin Gorda")
      expect(page).to_not have_content("Heli-Ski Alaska")
    end
  end
end
