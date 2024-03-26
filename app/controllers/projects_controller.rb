# frozen_string_literal: true

# CRUD actions for projects
class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save!

    redirect_to projects_path
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy!

    redirect_to projects_path, status: :see_other
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :priority)
  end
end
