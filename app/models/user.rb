class User < ActiveRecord::Base
  include BCrypt
  validates :email, :password_hash, presence: true
  validates :email, length: { minimum: 1 }
  validates :email, uniqueness: true
  has_many :projects

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
