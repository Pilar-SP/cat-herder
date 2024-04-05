# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController do
  let(:project) { Project.create(name: 'Project name', description: 'Project description', priority: 2.0) }

  describe 'GET new' do
    before { get :new, params: { project_id: project.id } }

    it 'renders new task page' do
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    before do
      post :create, params: { task: {
        name: 'Some task',
        description: 'Some description',
        priority: 1.5
      }, project_id: project.id }
    end

    it 'assigns @project' do
      expect(assigns(:project)).to eq(project)
    end

    it 'assigns @task' do
      task = project.tasks.last
      expect(assigns(:task)).to eq(task)
    end

    it 'redirects to project show' do
      expect(response).to redirect_to(project_path(project))
    end
  end
end
