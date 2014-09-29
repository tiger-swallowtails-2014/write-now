class GlobalController < ApplicationController
  def index
  	if current_user
	  	render "projects/_current_project"
  	else
  		render "_squeeze"
	  end
  end

  private
	  def current_user
	  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	  end

	  def active_project
	  	if current_user
	  		projects = current_user.projects
		  	if projects.empty?
		  		false
		  	else
		  		projects.last.active
		  	end
		  end
	  end
end