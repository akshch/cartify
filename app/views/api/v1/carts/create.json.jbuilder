json.cart do
  json.id @cart.id
  json.quantity @cart.quantity
  json.amount @cart.amount
  json.user_id @cart.user_id

  json.line_items do
    @cart.line_items.each do |line_item|
      json.quantity line_item.quantity
      json.amount line_item.amount
      json.product_id line_item.product_id
    end
  end
end
