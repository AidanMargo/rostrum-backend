class Api::AppointmentsController < ApplicationController


  def index
    appointments = Appointment.all
    render json: appointments
  end

  def create
    appointment = Appointment.create(appointment_params)
    if appointment.valid?
      render json: appointment, status: :created
    else
      render json: {errors: appointment.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    head :no_content  
  end

  def update
    appointment = Appointment.find(params[:id])
    if appointment
      appointment.update(appointment_params)
      render json: appointment
    else
      render json: {errors: appointment.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.permit(:id, :startDate, :endDate, :notes, :title, :allDay, :teacher_id, :rRule)
  end


end
