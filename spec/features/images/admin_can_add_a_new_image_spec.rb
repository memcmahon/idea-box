require 'rails_helper'

describe "only admins can add a new image" do
  before (:each) do
    @image = Image.create!(alt_tag: "Heliskiing", url: "https://images.unsplash.com/photo-1495554698253-681539e9ea84?ixlib=rb-0.3.5&s=72f6aabe1c8a038b8f4f6adfac6a5fba&auto=format&fit=crop&w=2850&q=80")
  end

  describe "as an admin they visit images_path" do
    it "they can add a new image" do
      admin = User.create(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      fill_in("image[url]", with: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYPaAmeoHvClKshaY-isK3YHsg6zV1jVyNJgnVsJxpePuRXPYz")
      fill_in("image[alt_tag]", with: "Capybara Pool Time")
      click_on("Create Image")

      expect(page).to have_xpath("//img[contains(@src,'#{@image.url}')]")
      expect(page).to have_content(@image.alt_tag)
      expect(page).to have_xpath("//img[contains(@src,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYPaAmeoHvClKshaY-isK3YHsg6zV1jVyNJgnVsJxpePuRXPYz')]")
      expect(page).to have_content("Capybara Pool Time")
    end
  end
end
