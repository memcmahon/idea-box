require 'rails_helper'

describe Category, type: :model do
  describe "Validations" do
    it "is invalid without a name" do
      category = Category.new

      expect(category).to_not be_valid
    end
  end

  describe "Relationships" do
    it {should have_many(:ideas)}
  end
end
