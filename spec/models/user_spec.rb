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

  describe "Roles" do
    it "can be created as an admin" do
      admin = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 1)

      expect(admin.role).to eq("admin")
      expect(admin.admin?).to be_truthy
    end

    it "can be created as a regular user" do
      user = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test", role: 0)

      expect(admin.role).to eq("default")
      expect(admin.default?).to be_truthy
    end

    it "can be defaulted to a regular user" do
      user = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test")

      expect(admin.role).to eq("default")
      expect(admin.default?).to be_truthy
    end
  end
end
