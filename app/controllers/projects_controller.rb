class ProjectsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @project = Project.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = Project.new(project_params)
    @user.save!
    redirect_to root_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :wordcount_goal, :goal_time_limit, :goal_deadline_date)
  end

end