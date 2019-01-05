class Api::V1::Admin::MentorsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    render json: AdminMentorSerializer.new(Mentor.all)
  end

  def show
    id = params[:id]
    render json: AdminMentorSerializer.new(Mentor.find(id))
  end
end
