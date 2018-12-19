class Api::V1::MentorsController < ApplicationController

  def index
    render json: MentorSerializer.new(Mentor.all)
  end

  def show

  end

  def update

  end

end