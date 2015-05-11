require "rails_helper"

describe "Lists" do
  it "must have a user and a due_date" do
    expect(List.create(title: "List One")).not_to be_valid
    user = create(:user)
    list = List.new(title: "List One", user: user)
    expect(list.title).to eq "List One"
    expect(list.user.name).to eq "Kit"
    expect(list.archived).to eq false
  end

  it "can have many tasks" do
    list = create(:list)
    create(:task, list: list)
    create(:task, list: list)
    create(:task, list: list)
    expect(list.tasks.count).to eq 3
  end


end
