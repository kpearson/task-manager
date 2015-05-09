require "rails_helper"

describe "Returning user" do
  it "can login" do
    create(:user)
    visit root_path
    click_link_or_button "Sign In"
    fill_in "user[email]",    with: "kit@example.com"
    fill_in "user[password]", with: "password"
    click_button "Submit"
    expect(page).to have_content "Welcome back Kit!"
  end
end
