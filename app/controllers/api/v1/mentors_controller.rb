class Api::V1::MentorsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: :destroy

  def create
    mentor = Mentor.new(mentor_params)
    if mentor.save
      render json: MentorSerializer.new(mentor), status: 201
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
    authorize_admin! unless request_matches_user?
    id = params[:id]
    Mentor.find(id).update(mentor_params)
    render json: MentorSerializer.new(Mentor.find(id))
  end

  def destroy
    id = params[:id]
    Mentor.find(id).delete
  end

  private

  def request_matches_user?
    @current_user.id == params[:id]
  end

  def create_mentor_user
    #use this method in the CREATE action
    # get the preferences out of the params and use them for mentor_user join table
  end

  def mentor_params
    params.require(:mentor).permit(:name,
                                  :email,
                                  :city,
                                  :state,
                                  :country,
                                  :slack_username,
                                  :matched,
                                  :active,
                                  :pronouns,
                                  :current_title,
                                  :current_employer,
                                  :background,
                                  :mentee_capacity,
                                  :stack_preference,
                                  industries: [],
                                  ways_to_mentor: [],
                                  expertise_tech: [],
                                  expertise_non_tech: [],
                                  identity_preference: [],
                                  meeting_location: []
                                )
  end
end
