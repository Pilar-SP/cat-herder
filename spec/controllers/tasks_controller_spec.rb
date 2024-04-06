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

  describe 'GET show' do
    let(:task) { Task.create(name: 'My task', description: 'My description', priority: 1.9, project_id: project.id) }

    before { get :show, params: { project_id: project.id, id: task.id } }

    it 'assigns @task' do
      expect(assigns(:task)).to eq(task)
    end

    it 'renders show page' do
      expect(response).to render_template('show')
    end
  end

  describe 'GET edit' do
    let(:task) { Task.create(name: 'My task', description: 'My description', priority: 1.9, project_id: project.id) }

    before { get :edit, params: { project_id: project.id, id: task.id } }

    it 'assigns @task' do
      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'PATCH update' do
    let(:task) { Task.create(name: 'My task', description: 'My description', priority: 1.9, project_id: project.id) }

    before do
      patch :update, params: {
        project_id: project.id,
        id: task.id,
        task: {
          name: 'My updated task',
          description: 'My description',
          priority: 1.9
        }
      }
    end

    it 'saves changes to @task' do
      expect(assigns(:task).name).to eq('My updated task')
    end

    it 'redirects to project show page' do
      expect(response).to redirect_to(project_task_path(task))
    end
  end

  describe 'DELETE destroy' do
    let(:task) { Task.create(name: 'My task', description: 'My description', priority: 1.9, project_id: project.id) }

    before do
      delete :destroy, params: {
        id: task.id,
        project_id: project.id
      }
    end

    it 'deletes @project' do
      expect(Task.exists?(task.id)).to be(false)
    end

    it 'redirects to index' do
      expect(response).to redirect_to(project_path(project))
    end
  end
end
