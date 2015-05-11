require 'rails_helper'

describe "Task" do
  it "belongs to a list" do
    expect(Task.create(title: "Coding task",
                       description: "Build a task manager")
          ).not_to be_valid

    list = create(:list)
    expect(Task.create(title: "Coding task",
                       description: "Build a task manager",
                       list: list)
          ).to be_valid
  end
end
