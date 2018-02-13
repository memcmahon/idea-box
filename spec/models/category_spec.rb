require 'rails_helper'

describe Category, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
  end

  describe "Relationships" do
    it { should have_many(:ideas) }
  end
end
