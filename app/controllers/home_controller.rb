class HomeController < ApplicationController
  def index
    if current_user
      @user = current_user
      if current_user.projects.any?
        @project = current_user.projects.last.active_project(current_user)
        @pace_needed = @project.check_goal_type
        render "projects/_current_project"
      else
        @project = Project.new
        render "projects/_new"
      end
    else
      render "_squeeze"
    end
  end
end