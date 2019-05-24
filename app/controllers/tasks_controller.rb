class TasksController < ApplicationController
  before_action :set_task, only: [:show]

  def index
    @tasks = Task.all.where(isprivate: false)
    # @tasks = Task.where(:user_id => current_user.id)
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :isprivate)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
