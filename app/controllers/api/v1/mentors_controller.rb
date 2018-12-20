class Api::V1::MentorsController < ApplicationController

  def create

  end

  def index
    render json: MentorSerializer.new(Mentor.all)
  end

  def show
    id = params[:id]
    render json: MentorSerializer.new(Mentor.find_by_id(id))
  end

  def update

  end

  def destroy

  end

end