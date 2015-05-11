require "rails_helper"

describe "New user" do
  it "can sign up" do
    fill_in_new_user_form
    expect(page).to have_content "Welcome Kit"
  end

  it "is singned in when created" do
    fill_in_new_user_form
    expect(page).to have_content "Sign Out"
  end

  it "can sign out" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)
    visit root_path
    click_link "Sign Out"
    expect(page).to have_content "Were going to miss you. | You have successfully signed out."

  end

  def fill_in_new_user_form
    visit root_path
    click_link_or_button "Please Sign Up"
    fill_in "user[name]",     with: "Kit"
    fill_in "user[email]",    with: "kit@kit.com"
    fill_in "user[password]", with: "password"
    click_button "Create User"
    expect(page).to have_content "Welcome Kit"
  end
end
