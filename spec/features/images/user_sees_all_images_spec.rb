require 'rails_helper'

describe "user sees all available images" do
  before (:each) do
    @image_1 = Image.create!(alt_tag: "Heliskiing", url: "https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80")
    @image_2 = Image.create!(alt_tag: "Virgin Gorda", url: "https://s-media-cache-ak0.pinimg.com/originals/d3/e8/cb/d3e8cba6aa1c3cb52c8e0169a18e4e08.jpg")
  end

  describe "they visit images_path" do
    xit "they can view all images" do
      visit images_path

      expect(page).to have_content("Images")
      expect(page).to have_content("Heliskiing")
      expect(page).to have_content("Virgin Gorda")
      expect(page).to have_xpath("//img[contains(@src,'https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80')]")
      expect(page).to have_xpath("//img[contains(@src,'https://s-media-cache-ak0.pinimg.com/originals/d3/e8/cb/d3e8cba6aa1c3cb52c8e0169a18e4e08.jpg')]")
    end
  end
end
