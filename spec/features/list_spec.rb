require "rails_helper"

describe "List" do
  it "new" do
    build_current_user
    visit root_path
    fill_in "title", with: "Test List"
    click_button "Submit"
    expect(page).to have_content "Test List"
  end

  it "can have tasks" do
    user = build_current_user
    list = create(:list, user: user)
    create(:task, title: "Title one", list: list)
    visit lists_path
    save_and_open_page
    click_link_or_button "List One"
    expect(page).to have_content "Add a task"
    fill_in "title", with: "Task blue"
    fill_in "description", with: "Blue task"
    click_button "Submit"
    expect(page).to have_content "Task blue"
  end

  def build_current_user
    user = create(:user)
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(user)
    user
  end
end
