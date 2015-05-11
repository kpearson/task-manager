class TaskMailer < ApplicationMailer
  def new_task_notice(user, email, task)
    @user = user
    @task = task
    mail(to: email, subject: "#{user.name} New task #{task.title} needs to get done.")
  end

  def complete_task_notice(user, email, task)
    @user = user
    @task = task
    mail(to: email, subject: "#{user.name} #{task.title} is done.")
  end

  def incomplete_task_notice(user, email, task)
    @user = user
    @task = task
    mail(to: email, subject: "#{user.name} #{task.title} is not done any more.")
  end
end
