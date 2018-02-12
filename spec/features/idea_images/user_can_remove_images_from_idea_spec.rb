require 'rails_helper'

describe "user can remove an image from an idea" do
  before(:each) do
    @user = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fake.com", password: "password!")
    @category = Category.create!(name: "Adventure")
    @image_1 = Image.create!(alt_tag: "Heliskiing", url: "https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80")
    @image_2 = Image.create!(alt_tag: "Virgin Gorda", url: "https://s-media-cache-ak0.pinimg.com/originals/d3/e8/cb/d3e8cba6aa1c3cb52c8e0169a18e4e08.jpg")
    @idea = @user.ideas.create!(title: "Heli-Ski Alaska", content: "lets go heliskiing in AK.", category: @category)
    IdeaImage.create!(image: @image_1, idea: @idea)
    IdeaImage.create!(image: @image_2, idea: @idea)
  end

  describe "they visit user_idea_path" do
    it "they can remove images" do
      visit user_idea_path(@user, @idea)

      click_on("Remove", match: :first)

      expect(current_path).to eq(user_idea_path(@user, @idea))
      expect(page).to have_xpath("//img[contains(@src,'https://s-media-cache-ak0.pinimg.com/originals/d3/e8/cb/d3e8cba6aa1c3cb52c8e0169a18e4e08.jpg')]")
      expect(page).to_not have_xpath("//img[contains(@src,'https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80')]")
    end
  end
end
