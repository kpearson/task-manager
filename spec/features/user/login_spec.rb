require "rails_helper"

describe "User" do
  it "can sign up" do
    visit root_path
    click_link_or_button "Please Sign Up"
    fill_in "user[name]",     with: "Kit"
    fill_in "user[email]",    with: "kit@kit.com"
    fill_in "user[password]", with: "password"
    click_button "Create User"
    expect(page).to have_content("Welcome Kit")
  end

  xit "can login" do
    user = create!(:user)

    visit_root_path
    click_link_or_button "Log in"
    fill_in "user[name]",     with: "Kit"
    fill_in "user[password]", with: "password"
    click_button "Submit"
  end
end
