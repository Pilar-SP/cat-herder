# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)
    @project.save!

    redirect_to projects_path
  end

  def update
    @project.update(project_params)
    @project.save!

    redirect_to projects_path
  end

  def destroy
    @project.destroy!

    redirect_to projects_path, status: :see_other
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :priority)
  end
end
