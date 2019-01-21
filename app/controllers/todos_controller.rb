class TodosController < ApplicationController
  before_action :authorize

  def index
    @todos = Todo.where(email: session[:current_email]).all
  end

  def new
    @todo = Todo.new
  end

  def create
    Todo.create! todo_params.merge(email: session[:current_email])
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
