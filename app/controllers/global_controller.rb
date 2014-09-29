class GlobalController < ApplicationController
  def index
    if !current_user
      render "_squeeze"
    else
      @user = current_user
      active_project ? active_project_displayer : new_project_displayer
    end
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def active_project
      current_user.projects.last.active if current_user.projects.any?
    end

    def new_project_displayer
      @project = Project.new
      render "projects/_new"
    end

    def active_project_displayer
      @project = @user.projects.last
      render "projects/_current_project"
    end
end
