class HomeController < ApplicationController
  def index
    if !current_user
      render "_squeeze"
    else
      @user = current_user
      active_project ? active_project_displayer : new_project_displayer
    end
  end

  private
    def active_project
      current_user.projects.last.active if current_user.projects.any?
    end

    def new_project_displayer
      @project = Project.new
      render "projects/_new"
    end

    def active_project_displayer
      @project = @user.projects.last
      if @project.check_goal_type == :days
        @pace_needed = @project.calculate_pace_needed_w_per_day_date
      else
        @pace_needed = @project.calculate_pace_needed_w_per_day_hours
      end
      render "projects/_current_project"
    end
end