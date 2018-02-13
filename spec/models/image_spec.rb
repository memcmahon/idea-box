require 'rails_helper'

describe Image, type: :model do
  describe "Validations" do
    it { should validate_presence_of :url }
    it { should validate_presence_of :alt_tag }
  end

  describe "Relationships" do
    it { should have_many(:ideas).through(:idea_images) }
  end
end
