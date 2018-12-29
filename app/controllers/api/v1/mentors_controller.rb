class Api::V1::MentorsController < ApplicationController

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
                                    :meeting_location,
                                    industries: [],
                                    ways_to_mentor: [],
                                    expertise_tech: [],
                                    expertise_non_tech: [],
                                    stack_preference: [],
                                    identity_preference: [])
    end

    def create_mentor_preferences
      #use this method in the CREATE action
      # get the preferences out of the params and use them to mentor_preferences join table
    end
end
