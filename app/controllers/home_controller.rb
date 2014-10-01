class HomeController < ApplicationController
  def index
    if !current_user
      render '_squeeze'
    else
      @user = current_user
      if current_user.active_projects?
        @project = current_user.get_project
        @words_left = @project.num_words_to_goal
        @time_left = @project.time_until_deadline
        @pace_unit = @project.pace_unit
        @percent_complete = @project.calc_words_percent_completed
        @pace_needed = @project.calculate_pace
        if @project.completed?
          @project.set_inactive
          @time_to_completion = @project.time_to_completion
          @successful = @project.successful_completion?
          render "/projects/_completed_project"
        else
          render "/projects/_current_project"
        end
      else
        @project = current_user.get_new_project_form
        @pace_unit = @project.pace_unit
        render "projects/_new"
      end
    end
  end
end