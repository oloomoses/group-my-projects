class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)

    if user
      session[:user_id] = user.id
      flash[:success] = "You are logged in"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Login failed"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
