class User < ActiveRecord::Base
  validates :email, :password_hash, presence: true
  validates :email, uniqueness: true
  has_many :projects
end
