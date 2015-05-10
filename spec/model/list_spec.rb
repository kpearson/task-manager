require "rails_helper"

describe "Lists" do
  it "must have a user" do
    expect(List.create(title: "List One")).not_to be_valid
    user = create(:user)
    list = List.new(title: "List One", user: user)
    expect(list.title).to eq "List One"
    expect(list.user.name).to eq "Kit"
    expect(list.archived).to eq false
  end
end
