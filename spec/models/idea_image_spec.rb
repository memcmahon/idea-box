require 'rails_helper'

describe IdeaImage, type: :model do
  describe "Validations" do
    it "is invalid without an idea" do
      idea_image = IdeaImage.new(image_id: 1)

      expect(idea_image).to_not be_valid
    end

    it "is invalid without an image" do
      idea_image = IdeaImage.new(idea_id: 1)

      expect(idea_image).to_not be_valid
    end
  end

  describe "Relationships" do
    it {should belong_to(:idea)}
    it {should belong_to(:image)}
  end
end
