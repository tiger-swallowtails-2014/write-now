class ProjectsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @project = Project.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = @user.projects.build(project_params)

    if @project.save
      redirect_to root_path
      # TODO: write conditional rendering check on global controller index action
    else
      flash.now[:error] = "Learn how to type ... if you want to be a writer."
      render :new
    end
  end

  private
    def project_params
      params.require(:project).permit(:title, :wordcount_goal, :goal_time_limit, :goal_deadline_date, :user_id)
    end
end