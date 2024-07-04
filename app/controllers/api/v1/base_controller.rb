class Api::V1::BaseController < ActionController::API
  before_action :authorize_request

  def not_found
    render json: { errors: 'not found' }, status: :not_found
  end

  helper_method :current_user_cart

  def current_user_cart
    @current_user.carts.first
  end

  private

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

end
