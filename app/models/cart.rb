class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items

  default_scope -> { order(created_at: :desc) }
end
