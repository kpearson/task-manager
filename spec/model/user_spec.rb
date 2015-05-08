require "rails_helper"

describe "User" do
  it "has a name" do
    expect(User.new(name: "Kit").name).to eq "Kit"
  end
end
