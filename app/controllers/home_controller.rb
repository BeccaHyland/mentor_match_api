class HomeController < ApplicationController
  before_action :authenticate_user, only: [:auth]

  def index
    render json: { service: 'auth-api', status: 200 }
  end

  def auth
    render json: { status: 200, message: "You are currently logged in as #{current_user.email}") }
  end
end