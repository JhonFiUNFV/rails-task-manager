class TasksController < ApplicationController
before_action :set_task, only: [:show, :edit, :destroy, :update]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  def edit
    render :edit
  end

  def show
  end

  def update
    @task= Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :details))
      flash[:success] = "To-do item successfully updated!"
      redirect_to action: "index"
    else
      flash.now[:error] = "To-do item update failed"
      render :edit
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
