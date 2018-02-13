require 'rails_helper'

describe "only admin sees all image index" do
  before (:each) do
    @image_1 = Image.create!(alt_tag: "Heliskiing", url: "https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80")
    @image_2 = Image.create!(alt_tag: "Virgin Gorda", url: "https://s-media-cache-ak0.pinimg.com/originals/d3/e8/cb/d3e8cba6aa1c3cb52c8e0169a18e4e08.jpg")
  end

  describe "as an admin they visit admin_images_path" do
    it "they can view all images" do
      admin = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      expect(page).to have_content("Images")
      expect(page).to have_content(@image_1.alt_tag)
      expect(page).to have_content(@image_2.alt_tag)
      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
      expect(page).to have_xpath("//img[contains(@src,'#{@image_1.url}')]")
      expect(page).to have_xpath("//img[contains(@src,'#{@image_2.url}')]")
    end
  end

  describe "as a regular user they cannot visit admin images_path" do
    it "they can view all images" do
      user = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_images_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
