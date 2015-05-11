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

  it "has a due date" do
    task = create(:task)
    expect(task.due_date).to eq "2015-05-11 14:02:23 -0600"
  end
end
