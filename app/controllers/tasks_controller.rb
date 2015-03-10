class TasksController < ApplicationController
  def task_types
    ['NoOpTask', 'UrlGetTask']
  end

  def task_type
    Rails.logger.info "task_types: #{task_types}"
    Rails.logger.info "params[:type]: #{params[:type].inspect}"
    actual = task_types.include?(params[:type]) ? params[:type] : 'Task'
    Rails.logger.info "actual: #{actual.inspect}"
    actual
  end

  def index
    @tasks = task_type.constantize.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = task_type.new(task_params)

    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:schedule, :type)
  end
end
