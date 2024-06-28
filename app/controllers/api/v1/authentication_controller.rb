class Api::V1::AuthenticationController < Api::V1::BaseController
  skip_before_action :authorize_request, except: :login

  def login
    @user = User.find_by(email: login_params[:email])
    if @user&.authenticate(login_params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, expiry_time: time.strftime("%m-%d-%Y %H:%M"), email: @user.email }, status: :ok
    else
      render json: { errors: 'unauthorized' }, status: :unauthorized
    end
  end

  private
  def login_params
    params.require(:authentication).permit(:email, :password)
  end

end
