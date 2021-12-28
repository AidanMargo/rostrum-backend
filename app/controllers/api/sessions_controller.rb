class Api::SessionsController < ApplicationController

  def create
    student = Student.find_by(email: params[:email])
    if student&.authenticate(params[:password])  
      session[:user_id] = student.id
      render json: student, status: :created
    else
      render json: {errors: "Invalid Username or Password"}, status: :unauthorized
    end
  end

  def teacher_create
    teacher = Teacher.find_by(email: params[:email])
    if teacher&.authenticate(params[:password])  
      session[:user_id] = teacher.id
      render json: teacher, status: :created
    else
      render json: {errors: "Invalid Username or Password"}, status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

  def show
    teacher = Teacher.find_by(id: session[:user_id])
    # avatar = rails_blob_path(teacher.avatar)

    if teacher
      render json: {user: teacher, total_students: teacher.total_students, lifetime_appointments: teacher.total_appointments}, 
      include: [:students, :todos, :appointments]
    else 
      render json: {errors: "User not found"}, status: :not_found
    end
  end

private

  
end
