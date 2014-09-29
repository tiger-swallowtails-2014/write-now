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
    else
      flash.now[:error] = "Learn how to type ... if you want to be a writer."
      render 'projects/_new'
    end
  end

  def edit
    @user = current_user
    @project = @user.projects.last
    if check_goal_type == :days
      @goal_field = :days
    else
      @goal_field = :hours
    end
    render :edit
  end

  def update
    @user = current_user
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    if check_goal_type == :days
      @pace_needed = @project.calculate_pace_needed_w_per_day_date
    else
      @pace_needed = @projcet.calculate_pace_needed_w_per_day_hours
    end
    render "_current_project"
  end

  private
    def project_params
      params.require(:project).permit(:title, :wordcount_goal, :goal_time_limit, :goal_deadline_date, :user_id)
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def check_goal_type
      @project.goal_time_limit ? (return :hours) : (return :days)
    end
end