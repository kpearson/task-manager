class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome #{user.name}"
    else
      redirect_to :back, notice: "Please enter valid information"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    redirect_to root_path, notice: "You have successfuly updated you info"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
