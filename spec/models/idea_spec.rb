require 'rails_helper'

describe Idea, type: :model do
  describe "Validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content}
  end

  describe "Relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many(:images).through(:idea_images) }
  end
end
