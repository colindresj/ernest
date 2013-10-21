class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  validates :password, :password_confirmation, :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :password_confirmation, :length => { in: 6..20 }
end
