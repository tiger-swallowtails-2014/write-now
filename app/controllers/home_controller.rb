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
        @words_left = @project.num_words_to_goal
        @time_left = @project.time_until_deadline
        @pace_unit = @project.pace_unit
        @pace_needed = @project.calculate_pace.floor
        render "/projects/_current_project"
      end
    end
  end
end