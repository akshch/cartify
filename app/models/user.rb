class User < ApplicationRecord
  has_secure_password
  has_many :carts
  has_many :orders

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
