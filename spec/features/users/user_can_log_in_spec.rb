require 'rails_helper'

describe "when a user logs in" do
  it "they see their personal info" do
    user = User.create!(first_name: "Jane", last_name: "Doe", email: "jane@fakemail.com", password: "test")

    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
  end
end
