class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :size => 120

  has_secure_password
  has_many :projects
  validates :email, :password_digest, presence: true
  validates :email, length: { minimum: 1 }
  validates :email, uniqueness: true

end