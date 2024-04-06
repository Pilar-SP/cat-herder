# frozen_string_literal: true

class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.create(task_params)
    @task.project = @project
    @task.save

    redirect_to project_path(@project)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.save

    redirect_to project_task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :priority)
  end
end
