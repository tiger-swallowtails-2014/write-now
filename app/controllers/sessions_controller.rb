class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid username or password."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end