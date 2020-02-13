class User < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :surname, presence: true
  validates :nick, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true, email: true, uniqueness: true

end
