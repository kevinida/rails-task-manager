class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # Générer une nouvelle instance de task
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task.update(task_params)

    redirect_to task_path(params[:id])
  end

  def destroy
    @task.destroy

    redirect_to tasks_path, status: :see_other
  end

  
end

  private

  def task_params # Strong params
      params.require(:task).permit(:title, :details, :completed)
      # retourne le hash avec les infos
  end

  def set_task
      @task = Task.find(params[:id])
  end
