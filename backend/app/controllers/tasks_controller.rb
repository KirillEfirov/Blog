# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: I18n.t('notice.created', resource: Task.name) }
      else
        format.html { redirect_to tasks_url, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: I18n.t('notice.updated', resource: Task.name) }
        format.turbo_stream { flash.now[:notice] = I18n.t('notice.updated', resource: Task.name) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to tasks_url, notice: I18n.t('notice.deleted', resource: Task.name), status: :see_other
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])

    render json: { message: 'Success' }
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
