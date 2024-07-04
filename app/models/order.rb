class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_many :order_details
end
