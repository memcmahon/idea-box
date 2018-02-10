require 'rails_helper'

describe "users can view the details of a single idea" do
  before(:each) do
    @user = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fake.com", password: "password!")
    @category = Category.create!(name: "Adventure")
    @image_1 = Image.create!(url: "https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80")
    @image_2 = Image.create!(url: "https://s-media-cache-ak0.pinimg.com/originals/d3/e8/cb/d3e8cba6aa1c3cb52c8e0169a18e4e08.jpg")
    @idea_1 = @user.ideas.create!(title: "Heli-Ski Alaska", content: "lets go heliskiing in AK.", category: @category)
    @idea_2 = @user.ideas.create!(title: "Boulder Virgin Gorda", content: "lets boulder in virgin gorda!", category: @category)
    IdeaImage.create!(image: @image_1, idea: @idea_1)
    IdeaImage.create!(image: @image_2, idea: @idea_2)
  end

  describe "they visit user_idea_path" do
    it "they can see all the idea details(including photos)" do
      visit user_idea_path(@user, @idea_1)

      expect(page).to have_content("Heli-Ski Alaska")
      expect(page).to have_content("Adventure")
      expect(page).to have_content("lets go heliskiing in AK.")
      expect(page).to have_content("https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80")
      expect(page).to_not have_content("Boulder Virgin Gorda")
    end
  end
end
