class User < ActiveRecord::Base
  has_secure_password
  has_many :projects
  validates :email, :password_digest, presence: true
  validates :email, length: { minimum: 1 }
  validates :email, uniqueness: true


  def get_project
    projects.last.active_project(self)
  end

  def active_projects?
    projects.any? { |project| project.active? }
  end

  def past_projects
    projects if projects.any? && !active_projects?
  end

  def get_new_project_form
    Project.new
  end

  include Gravtastic
  gravtastic :size => 120,
            :default => "identicon"

end