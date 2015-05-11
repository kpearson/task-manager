class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to list_path(params[:list_id])
    else
      redirect_to :back, notice: "Please include a Title and Discription"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update_attributes(update_task_params)
    redirect_to list_path(task.list_id)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to :back, notice: "#{task.title} has been Delted"
  end

  def complete
    task = Task.find(params[:id])
    task.update_attributes(complete: params[:complete])
    redirect_to :back, notice: "#{task.title} marked complete"
  end

  private

  def task_params
    params.permit(:title, :description, :list_id)
  end

  def update_task_params
    params.require(:task).permit(:title, :description, :list_id)
  end

end
