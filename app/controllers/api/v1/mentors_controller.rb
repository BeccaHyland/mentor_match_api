class Api::V1::MentorsController < ApplicationController

  def create
    mentor = Mentor.new(mentor_params)
    if mentor.save
      render json: MentorSerializer.new(mentor)
    else
      render json: {}, status: 401
    end
  end

  def index
    render json: MentorSerializer.new(Mentor.all)
  end

  def show
    id = params[:id]
    render json: MentorSerializer.new(Mentor.find(id))
  end

  def update

  end

  def destroy

  end

  private
    def mentor_params
      params.require(:mentor).permit(:name, :email, :city, :state, :slack_username, :linkedin_username, :github_username, :matched, :program, :active)
    end
end