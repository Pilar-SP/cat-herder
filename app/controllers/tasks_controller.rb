# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :create]

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.create(task_params)
    @task.project = @project
    @task.save

    redirect_to project_path(@project)
  end

  def update
    @task.update(task_params)
    @task.save

    redirect_to project_task_path(@task)
  end

  def destroy
    @task.destroy!

    redirect_to project_path(@task.project), status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :priority)
  end
end
