class Api::V1::MentorsController < ApplicationController

  # before_action :authenticate_user!
  # before_action :authorize_admin!, only: :destroy

  def create
    # # if admin_user?
    #   render json: {}, status: 401
    # else
      mentor = Mentor.new(mentor_params)
      #mentor.user_id = @current_user.id
      if mentor.save
        render json: MentorSerializer.new(mentor), status: 201
      else
        render json: {}, status: 400
      end
    #end
  end

  def index
    # if admin_user?
      render json: AdminMentorSerializer.new(Mentor.all)
    # else
    #   render json: MentorSerializer.new(Mentor.all)
    # end
  end

  def show
    id = params[:id]
    # if admin_user? || request_matches_user?
      render json: AdminMentorSerializer.new(Mentor.find(id))
    # else
    #   render json: MentorSerializer.new(Mentor.find(id))
    # end
  end

  def update
    # if admin_user? || request_matches_user?
      id = params[:id]
      Mentor.find(id).update(mentor_params)
      render json: MentorSerializer.new(Mentor.find(id))
    # else
    #   head :unauthorized
    # end
  end

  def destroy
    id = params[:id]
    Mentor.find(id).delete
  end

  private

  def request_matches_user?
    mentor = Mentor.find(params[:id].to_i)
    @current_user.id == mentor.user.id
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
