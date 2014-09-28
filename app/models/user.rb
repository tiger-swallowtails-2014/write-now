class User < ActiveRecord::Base
  has_secure_password
  validates :email, :password_digest, presence: true
  validates :email, length: { minimum: 1 }
  validates :email, uniqueness: true
  has_many :projects
end