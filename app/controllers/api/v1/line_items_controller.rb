class Api::V1::LineItemsController < Api::V1::BaseController

  def create
    @line_item = current_user_cart.line_items.find_by(product_id: params[:product_id])
    if @line_item.present? && params[:quantity].present?
      product = @line_item.product
      if params[:quantity].to_i.positive?
        if params[:remove].nil?
          @line_item.quantity = @line_item.quantity + 1
          product.quantity = product.quantity + 1
        elsif params[:remove] == true
          @line_item.quantity = @line_item.quantity - 1
          product.quantity = product.quantity - 1
        end
        @line_item.save
        product.save
      end
    end
  end

  def destroy
    @line_item = current_user_cart.line_items.find_by(id: params[:id])
    if @line_item.present?
      @line_item.destroy
    else
      render json: { error: 'Something went wrong!'}, status: :unprocessable_entity
    end
  end

end
