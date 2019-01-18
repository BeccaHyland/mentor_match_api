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

  def update
    id = params[:id]
    Mentor.find(id).update(mentor_params)
    render json: MentorSerializer.new(Mentor.find(id))
  end

  def destroy
    id = params[:id]
    Mentor.find(id).delete
  end

  private

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
                                  :user_id,
                                  industries: [],
                                  ways_to_mentor: [],
                                  expertise_tech: [],
                                  expertise_non_tech: [],
                                  identity_preference: [],
                                  meeting_location: []
                                )
  end
end
