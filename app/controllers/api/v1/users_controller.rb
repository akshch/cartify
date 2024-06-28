class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authorize_request, only: [:create]
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: users, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render  json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render  json: @user, status: :ok
  end

  def update
    @user.update(user_params)
    if @user.valid?
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: { message: 'User deleted Successfully' }, status: :ok
    end
  end

  private

  def user_params
    params.require(:users).permit(:first_name, :last_name, :email, :password, :mobile_no)
  end

  def find_user
    @user = User.find_by(id: params[:id])
    unless @user
      render json: { errors: 'User not found!' }, status: :not_found
    end
  end

end
