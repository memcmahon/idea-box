require 'rails_helper'

describe User, type: :model do
  describe "Validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe "Relationships" do
    it { should have_many :ideas }
  end
end