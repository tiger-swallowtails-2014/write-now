class GlobalController < ApplicationController
  def index
    if !current_user
      render "_squeeze"
    else
      if active_project
        @user = current_user
        @project = @user.projects.last
        render "projects/_current_project"
      else
        @user = current_user
        @project = Project.new
        render "projects/_new"
      end
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def active_project
    current_user.projects.last.active if current_user.projects.any?
  end
end
