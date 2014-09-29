class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid account information. Try signing up again with different information."
      redirect_to signup_form_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end