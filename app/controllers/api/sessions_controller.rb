class Api::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])  
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: {errors: "Invalid Username or Password"}, status: :unauthorized
    end
  end

  def show
    byebug
    # Need to find way to check teachers and students tables to find the current user. maybe an if statement?
    user = .find_by(id: session[:user_id])
    byebug
    if user
      render json: user
    else 
      render json: {errors: "User not found"}, status: :not_found
    end
  end



end
