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
        @days_left = @project.days_until_deadline
        @words_left = @project.num_words_to_goal
        @pace_unit = @project.pace_unit
        @pace_needed = @project.calculate_pace.floor
        render "/projects/_current_project"
      end
    end
  end
end