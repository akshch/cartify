class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_one :order

  default_scope -> { order(created_at: :desc) }
end
