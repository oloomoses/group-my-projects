class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username].downcase)

    if user
      session[:user_id] = user.id
      flash[:notice] = 'You are logged in'
      redirect_to user_path(current_user)
    else
      flash[:alert] = 'Login failed, Username does not exist'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
