class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    binding.pry
    if task.save
     new_task_mailer(task) if email_check(task)
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
    if email_check(task)
      complete_task_mailer(task) if params[:complete] == "true"
      incomplete_task_mailer(task) if params[:complete] == "false"
    end
    task.update_attributes(complete: params[:complete])
    redirect_to :back, notice: "#{task.title} marked complete"
  end

  private

  def task_params
    params.permit(:title, :description, :list_id, :due_date)
  end

  def update_task_params
    params.require(:task).permit(:title, :description, :list_id)
  end

  def new_task_mailer(task)
     email = task.title.scan(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/)
     TaskMailer.new_task_notice(current_user, email, task).deliver
  end

  def complete_task_mailer(task)
     email = task.title.scan(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/)
     TaskMailer.complete_task_notice(current_user, email, task).deliver
  end

  def incomplete_task_mailer(task)
     email = task.title.scan(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/)
     TaskMailer.incomplete_task_notice(current_user, email, task).deliver
  end

  def email_check(task)
    task.title.split.grep(/\/cc/).any?
  end
end
