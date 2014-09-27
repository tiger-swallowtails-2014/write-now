class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    @user.save!
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end