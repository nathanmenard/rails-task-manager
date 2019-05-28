class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_as_done]

  def index
    @tasks = Task.all
  end

  def show
    build_status_message
  end

  def new
    @task = Task.new
  end

  def create
    # 1. Construire un object task à partir de params[:task]
    task = Task.new(task_params)
    # 2. Sauver l'objet en DB
    task.save
    # 3. Redirige vers la liste des restos
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def build_status_message
    # @status = @task[:completed]
    if @task[:completed] == true
      @status = "Task completed!"
    else
      @status = "Task not completed"
      # link_to 'Mark it as done?', method: :mark_as_done
    end
  end

  def mark_as_done
    @task.update(completed: true)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
