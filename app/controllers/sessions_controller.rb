class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by_email(params[:user][:email])
      login(user)
  end

  def destroy
    flash[:success] = "Were going to miss you. | You have successfully signed out."
    session.clear
    redirect_to root_path
  end

  private

  def login(user)
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.name}!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid login."
      render(:new)
    end
  end

end
