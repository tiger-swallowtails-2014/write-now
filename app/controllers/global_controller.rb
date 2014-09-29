class GlobalController < ApplicationController

# CR this should be separated into welcome/index for squeeze and projects index for the else
  def index
    if !current_user
      render "_squeeze"
    else
      @user = current_user  #just use current_user directly on the view
      active_project ? active_project_displayer : new_project_displayer
      # CR render method should be here  if active - set then render else set then render
    end
  end

  private
# CR move this to the user model
    def active_project
      current_user.projects.last.active if current_user.projects.any?
    end

    def new_project_displayer
      @project = Project.new
      render "projects/_new"
    end
# CR this is way to much logic for the controller move to project model
    def active_project_displayer
      @project = @user.projects.last
      # CR add a calc pace needed method to project model.
      if check_goal_type == :days
        @pace_needed = @project.calculate_pace_needed_w_per_day_date
      else
        @pace_needed = @project.calculate_pace_needed_w_per_day_hours
      end
      render "projects/_current_project"
    end

    def check_goal_type
      @project.goal_time_limit ? (return :hours) : (return :days)
    end
end
