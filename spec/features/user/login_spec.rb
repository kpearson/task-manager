require "rails_helper"

describe "Signed up user" do
  it "can login" do
    create(:user)
    visit root_path
    click_link_or_button "Sign In"
    fill_in "user[email]",    with: "kit@example.com"
    fill_in "user[password]", with: "password"
    click_button "Submit"
    expect(page).to have_content "Welcome back Kit!"
  end

  xit "can change name and email" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(user)
    visit edit_user_path(user)
    puts user.id
    puts user.name
    fill_in "user_name",  with: "Bob"
    fill_in "user_email", with: "bob@example.com"
    click_button "Update User"
    puts user.name
    puts user.id
    expect(page).to have_content "You have successfuly updated you info"
    expect(user.name).to eq "Bob"
  end

  xit "can see their own profile page" do
    user = create(:user)
    visit users_path(user)
    expect(page).not_to have_content "Edit Profile"
    allow_any_instance_of(ApplicationController).to
      receive(:current_user).and_return(user)
    visit users_path(user)
    expect(page).to have_content "Edit Profile"
  end

  it "see there list after loging in" do
    user = create(:user)
    create(:list, user: user)
    # create(:task, list: list)
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(user)
    visit root_path
    save_and_open_page
    expect(page).to have_content "List One"
    # expect(page).to have_content "Tast One"
  end
end
