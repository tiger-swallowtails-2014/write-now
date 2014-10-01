class ProjectsController < ApplicationController
  def new
    @user = current_user
    @project = Project.new
  end

  def create
    @user = current_user
    @project = @user.projects.build(project_params)
    if @project.save
      if @user.projects.count == 1
        @user.badges.build(badge_name: "First Project Created!", award_trigger: "project1 #create success")
        @user.save
      end
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
    render partial: 'projects/edit'
  end

  def update
    @user = current_user
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    @pace_needed = @project.calculate_pace
    @words_left = @project.num_words_to_goal
    @time_left = @project.time_until_deadline
    @pace_needed = @project.calculate_pace.floor
    @percent_complete = @project.calc_words_percent_completed.round(0)
    @pace_unit = @project.pace_unit
    redirect_to root_path
  end

  def update_wordcount
    @user = current_user
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)

    @project.milestones.create!(wordcount: project_params[:current_wordcount])
    p @project.milestones + " OUR MILESTONES"
    @words_left = @project.num_words_to_goal
    @time_left = @project.time_until_deadline
    @pace_needed = @project.calculate_pace.floor
    @percent_complete = @project.calc_words_percent_completed.round(0)
    render json: [@words_left, @time_left, @pace_needed, @percent_complete]
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