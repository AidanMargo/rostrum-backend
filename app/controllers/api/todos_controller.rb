class Api::TodosController < ApplicationController

  def index
    todos = Todo.all 
    render json: todos
  end

  def create
    todo = Todo.create(todo_params)
    if todo.valid?
      render json: todo, status: :created
    else
      render json: {errors: todo.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    todo =Todo.find(params[:id])
    if todo
      todo.destroy
      head :no_content
    else
      render json: {error: 'Todo not found'}, status: :not_found
    end
  end

  
  private
  
  def todo_params
    params.permit(:teacher_id, :content)
  end
  
end
