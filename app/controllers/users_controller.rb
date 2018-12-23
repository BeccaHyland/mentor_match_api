class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :current, :update]
  before_action :authorize_as_admin, only: [:destroy]
  before_action :authorize, only: [:update]

  def index
    render json: { status: 200, message: 'Logged-in'}
  end

  def current
    render json: current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { status: 200, message: "User successfully created." }
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: { status: 200, message: "User successfully updated." }
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { status: 200, message: "User successfully deleted." }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def authorize
    return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
  end

end