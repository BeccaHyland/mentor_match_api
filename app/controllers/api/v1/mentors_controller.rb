class Api::V1::MentorsController < ApplicationController

  def create
    mentor = Mentor.new(mentor_params)
    if mentor.save
      render json: MentorSerializer.new(mentor)
    end
  end

  def index
    render json: MentorSerializer.new(Mentor.all)
  end

  def show
    id = params[:id]
    render json: MentorSerializer.new(Mentor.find_by_id(id))
  end

  def update
    id = params[:id]
    Mentor.find_by_id(id).update(mentor_params)
  end

  def destroy
    id = params[:id]
    Mentor.find_by_id(id).destroy
  end

  private
    def mentor_params
      params.require(:mentor).permit(:name, :email, :city, :state, :slack_username, :linkedin_username, :github_username, :matched, :program, :active)
    end
end