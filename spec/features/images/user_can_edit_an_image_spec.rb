require 'rails_helper'

describe "user can edit an image" do
  before (:each) do
    @image_1 = Image.create!(alt_tag: "Heliskiing", url: "https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80")
  end

  describe "they visit images_path" do
    it "they can edit an image" do
      visit images_path

      click_on("Edit", match: :first)

      fill_in("image[url]", with: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYPaAmeoHvClKshaY-isK3YHsg6zV1jVyNJgnVsJxpePuRXPYz")
      fill_in("image[alt_tag]", with: "Capybara Pool Time")

      expect(page).to_not have_xpath("//img[contains(@src,'https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80')]")
      expect(page).to_not have_content("Heliskiing")
      expect(page).to have_xpath("//img[contains(@src,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYPaAmeoHvClKshaY-isK3YHsg6zV1jVyNJgnVsJxpePuRXPYz')]")
      expect(page).to have_content("Capybara Pool Time")
    end
  end
end
