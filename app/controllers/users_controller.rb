class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid account information. Try signing up again with different information."
      redirect_to signup_form_path
    end
  end

  def show
    @user = User.find(params[:id])
    @past_projects = @user.past_projects
    if @user.active_projects?
      @current_project = @user.get_project
    else
      @current_project = ""
    end
    @quote = Quote.random_quote
    @prompt = Prompt.random_prompt
    @badges = @user.badges
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params) ? (redirect_to @user) : (render :edit)
  end

  def destroy
    if current_user.destroy
      session[:id] = nil
      redirect_to root_path
    else
      flash.now[:error] = "Account Deletion failed! Please try again."
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end