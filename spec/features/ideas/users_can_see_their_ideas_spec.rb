require 'rails_helper'

describe "a user can see a list of their own ideas" do
  before(:each) do
    @user = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fake.com", password: "password!")
    @category = Category.create!(name: "Adventure")
    @idea_1 = @user.ideas.create!(title: "Heli-Ski Alaska", content: "lets go heliskiing in AK.", category: @category)
    @idea_2 = @user.ideas.create!(title: "Boulder Virgin Gorda", content: "lets boulder in virgin gorda!", category: @category)
  end

  describe "they visit user_ideas_path" do
    it "they see all of their ideas" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      
      visit user_ideas_path(@user)

      expect(page).to have_content("Heli-Ski Alaska")
      expect(page).to have_content("lets go heliskiing in AK.")
      expect(page).to have_content("Boulder Virgin Gorda")
      expect(page).to have_content("lets boulder in virgin gorda!")
    end
  end
end
