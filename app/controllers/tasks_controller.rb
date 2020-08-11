class TasksController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @new_task = Task.new(create_task)
    @new_task.save

    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(create_task)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def create_task
    params.require(:task).permit(:name, :details, :completed)
  end

  def set_id
    @task = Task.find(params[:id])
  end
end
