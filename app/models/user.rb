class User < ApplicationRecord
  has_secure_password
  has_many :carts

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
