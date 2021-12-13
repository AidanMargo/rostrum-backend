class Api::StudentsController < ApplicationController

  def index
    students = Student.all 
    render json: students
  end

  def show
    student = Student.find(params[:id])
    if student
      render json: student
    else
      render json: {errors: student.errors.full_messages}, status: :not_found
    end
  end

  def create
    student = Student.create(student_params)
    if student.valid?
      session[:user_id] = student.id
      byebug
      render json: student, status: :created
    else
      render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    student = Student.find(session[:user_id])
    session.destroy :user_id
    student.destroy
  end


  private

  def student_params
    params.permit(:first_name, :last_name, :email, :address, :phone_number, :password, :password_confirmation, :student, :profile_pic)
  end 
end
