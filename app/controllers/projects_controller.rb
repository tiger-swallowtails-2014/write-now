class ProjectsController < ApplicationController
  def new
    @user = current_user
    @project = Project.new
  end

  def create
    @user = current_user
    @project = @user.projects.build(project_params)
    if @project.save
      redirect_to root_path
    else
      flash.now[:error] = "Learn how to type ... if you want to be a writer."
      render 'projects/_new'
    end
  end

  def edit
    @user = current_user
    @project = @user.projects.last
    @goal_field = @project.check_goal_type
    render :edit
  end

  def update
    @user = current_user
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    @pace_needed = @project.calculate_pace
    redirect_to root_path
  end

  def destroy
    @project = current_user.projects.last
    @project.destroy
    redirect_to root_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :wordcount_goal, :goal_time_limit, :goal_deadline_date, :user_id, :current_wordcount)
    end
end