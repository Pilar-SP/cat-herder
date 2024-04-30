# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ActionController::API
      def index
        @projects = Project.all
        render json: @projects, status: :ok
      end

      def create
        @project = Project.new(
          name: params[:name],
          description: params[:description],
          priority: params[:priority]
        )

        if @project.save
          head :created
        else
          render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
