class Api::TeachersController < ApplicationController
  before_action :authenticate_user
  skip_before_action :authenticate_user, only:[:create, :show, :update]


  def index
    teachers = Teacher.all 
    render json: teachers
  end

  def show
    teacher = Teacher.find(session[:user_id])
    if teacher
      render json: {teacher: teacher}, include: [:students, :todos]
    else
      render json: {errors: teacher.errors.full_messages}, status: :not_found
    end
  end

  def create
    # user = User.create()
    teacher = Teacher.create(teacher_params)
    # teacher.user_id = user.id
    if teacher.valid?
      session[:user_id] = teacher.id
      render json: teacher, status: :created
    else
      render json: {errors: teacher.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    teacher = Teacher.find(session[:user_id])
    if teacher
      teacher.update(teacher_params)
      render json: teacher
    else
      render json: {errors: teacher.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def destroy
    teacher = Teacher.find(session[:user_id])
    session.destroy :user_id
    teacher.destroy
  end


  private

  def teacher_params
    params.permit(:first_name, :last_name, :email, :address, :phone_number, :password, :password_confirmation, :id)
  end 

  def authenticate_user
    return render json: { error: "Not authorized" }, status: :unauthorized unless session[:user_id] == params[:id]
  end

end
