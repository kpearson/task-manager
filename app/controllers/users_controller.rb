class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new
    if user.save
      redirect_to task_lists_path, notice: "Welcome #{user.name}"
    else
      redirect_to :back
    end
  end
end
