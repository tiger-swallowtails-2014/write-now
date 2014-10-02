class User < ActiveRecord::Base
  has_secure_password
  has_many :projects
  has_and_belongs_to_many :badges
  validates :email, :password_digest, presence: true
  validates :email, length: { minimum: 1 }
  validates :email, uniqueness: true


  def get_project
    projects.select { |project| project.active }.first
  end

  def active_projects?
    projects.any? { |project| project.active? }
  end

  def past_projects
    if projects.any?
      return projects.select { |project| !project.active }
    end
  end

  def get_new_project_form
    Project.new
  end

  include Gravtastic
  gravtastic size: 120, default: "identicon"
end