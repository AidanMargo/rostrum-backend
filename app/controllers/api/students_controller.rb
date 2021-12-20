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
    teacher = Teacher.find(session[:user_id])
    if student.valid?
      TeacherStudent.create(teacher_id: teacher.id, student_id: student.id)
      render json: student, status: :created
    else
      render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    student = Student.find(params[:id])
    if student
      student.update(student_params)
      render json: student
    else
      render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
  end


  private

  def student_params
    params.permit(:first_name, :last_name, :email, :address, :phone_number, :age, :notes, :student, :id)
  end 
end
