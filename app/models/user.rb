# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :documents
  has_many :editables

  has_secure_password
  validates :password, :password_confirmation, :email, :presence => true, :on => :create
  validates :email, :uniqueness => true
  validates :password, :password_confirmation, :length => { in: 6..20 }

  before_create :beta_invited?
  def beta_invited?
    invite = BetaInvite.where(:email => email).first
    if invite.nil?
      errors.add :email, "#{email} is not in our beta list."
      false
    elsif invite.access == false
      errors.add :email, "#{email} does not yet have access."
      false
    end
  end

  before_create { generate_token(:auth_token) }
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists? column => self[column]
  end
end
