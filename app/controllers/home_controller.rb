class HomeController < ApplicationController
  def index
    if !current_user
      render '_squeeze'
    else
      @user = current_user
      if current_user.projects.none?
        @project = current_user.get_new_project_form
        @pace_unit = @project.pace_unit
        render "projects/_new"
      else
        @project = current_user.get_project
        @pace_unit = @project.pace_unit
        @pace_needed = @project.calculate_pace
        render "/projects/_current_project"
      end
    end
  end
end