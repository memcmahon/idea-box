require 'rails_helper'

describe "user can create a new idea" do
  before(:each) do
    @user = User.create!(first_name: "Jane", last_name: "Doe", email: "janefake.com", password: "password!")
    @category_1 = Category.create!(name: "Adventure")
    @category_2 = Category.create!(name: "Relax")
    @image_1 = Image.create!(alt_tag: "Helisiing", url: "https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80")
    @image_2 = Image.create!(alt_tag: "Virgin Gorda", url: "https://s-media-cache-ak0.pinimg.com/originals/d3/e8/cb/d3e8cba6aa1c3cb52c8e0169a18e4e08.jpg")
  end

  describe "user visits user_ideas_path" do
    it "they can create a new idea" do
      visit user_ideas_path(user)

      click_on("New Idea")

      fill_in("idea[title]", with: "Heli-Ski Alaska")
      fill_in("idea[content]", with: "Lets shred in AK!")
      select("Adventure", :from => "idea[category_id]")
      click_on("Create Idea")

      expect(current_path).to eq(user_idea_path(@user, Idea.last))
    end
  end
end
