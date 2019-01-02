class Api::V1::StudentMentorsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :authorize_admin!

  def create
    student_mentor = StudentMentor.new(student_mentor_params)
    if student_mentor.save
      render json: StudentMentorSerializer.new(student_mentor), status: 201
    else
      render json: {}, status: 401
    end
  end

  def index
    render json: StudentMentorSerializer.new(StudentMentor.all)
  end

  def show
    id = params[:id]
    render json: StudentMentorSerializer.new(StudentMentor.find(id))
  end

  def update
    id = params[:id]
    StudentMentor.find(id).update(student_mentor_params)
    render json: StudentMentorSerializer.new(StudentMentor.find(id))
  end

  def destroy
    id = params[:id]
    StudentMentor.find(id).delete
  end

  private
    def student_mentor_params
      params.require(:student_mentor).permit(:mentor_id,
                                    :student_id,
                                    :active)
    end
end
