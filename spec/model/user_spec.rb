require "rails_helper"

describe "User" do
  it "has a name and email" do
    user = User.new(name: "Kit",
                    email: "kit@kit.com",
                    password: "password"
                   )

    expect(user.name).to eq "Kit"
    expect(user.email).to eq "kit@kit.com"
  end
end
