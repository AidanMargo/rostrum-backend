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
    byebug
    if teacher&.authenticate(params[:password])  
      session[:user_id] = teacher.id
      render json: teacher, status: :created
    else
      render json: {errors: "Invalid Username or Password"}, status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
    header :no_content
  end

  def show
    # Need to find way to check teachers and students tables to find the current user. maybe an if statement?
    user = Teacher.find_by(id: session[:user_id])
    if user
      render json: user
    else 
      render json: {errors: "User not found"}, status: :not_found
    end
  end



end
