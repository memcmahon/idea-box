require 'rails_helper'

describe "user can edit an idea" do
  before(:each) do
    @user = User.create!(first_name: "Jane", last_name: "Doe", email: "janefake.com", password: "password!")
    @category_1 = Category.create!(name: "Adventure")
    @category_2 = Category.create!(name: "Relax")
    @idea_1 = @user.ideas.create!(title: "Heli-Ski Alaska", content: "lets go heliskiing in AK.", category: @category_1)
    @idea_2 = @user.ideas.create!(title: "Boulder Virgin Gorda", content: "lets boulder in virgin gorda!", category: @category_1)
    @image_1 = Image.create!(alt_tag: "Heliskiing", url: "https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80")
    @image_2 = Image.create!(alt_tag: "Virgin Gorda", url: "https://s-media-cache-ak0.pinimg.com/originals/d3/e8/cb/d3e8cba6aa1c3cb52c8e0169a18e4e08.jpg")
  end

  describe "user visits user_idea_path" do
    it "they can edit that idea" do
      visit user_idea_path(@user, @idea_1)

      click_on("Edit")

      fill_in("idea[title]", with: "Spa Weekend")
      fill_in("idea[content]", with: "I need a massage!")
      select("Relax", :from => "idea[category_id]")
      check("Virgin Gorda")
      click_on("Update Idea")

      expect(page).to have_content("Spa Weekend")
      expect(page).to have_content("I need a massage!")
      expect(page).to have_content("Relax")
      expect(page).to have_xpath("//img[contains(@src,'#{@image_2.url}')]")
      expect(page).to_not have_content("Heli-Ski Alaska")
      expect(page).to_not have_content("Adventure")
    end
  end

  describe "user visits user_ideas_path" do
    it "they can edit that idea" do
      visit user_ideas_path(@user)

      click_on("Edit", match: :first)

      fill_in("idea[title]", with: "Spa Weekend")
      fill_in("idea[content]", with: "I need a massage!")
      select("Relax", :from => "idea[category_id]")
      check("Virgin Gorda")
      click_on("Update Idea")

      expect(page).to have_content("Spa Weekend")
      expect(page).to have_content("I need a massage!")
      expect(page).to have_content("Relax")
      expect(page).to have_xpath("//img[contains(@src,'#{@image_2.url}')]")
      expect(page).to_not have_content("Heli-Ski Alaska")
      expect(page).to_not have_content("Adventure")
    end
  end
end
