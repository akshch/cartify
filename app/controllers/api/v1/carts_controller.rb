class Api::V1::CartsController < Api::V1::BaseController

  def create
    @cart = @current_user.carts.create(cart_params)
    if @cart.save
      @cart.line_items.create(quantity: @cart.quantity, amount: @cart.amount, product_id: params[:product_id])
    else
      render json: { error: 'SOmething went wrong!' }, status: :unprocessable_entity
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:amount, :quantity, :user_id, :product_id)
  end
end
