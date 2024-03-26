# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController do
  describe 'GET index' do
    let!(:project) { Project.create(name: 'Fix table', description: 'Table has 2 legs broken', priority: 1.4) }

    before { get :index }

    it 'assigns @projects' do
      expect(assigns(:projects)).to eq([project])
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    let!(:project) { Project.create(name: 'Fix table', description: 'Table has 2 legs broken', priority: 1.4) }

    before { get :show, params: { id: project.id } }

    it 'assigns @project' do
      expect(assigns(:project)).to eq(project)
    end

    it 'renders project show page' do
      expect(response).to render_template('show')
    end
  end

  describe 'POST create' do
    before do
      post :create, params: { project:
      { name: 'Fix table',
        description: 'Table has 2 broken legs',
        priority: 1.2 } }
    end

    let(:project) { Project.find_by(name: 'Fix table') }

    it 'assigns @project' do
      expect(Project.last).to eq(project)
    end

    it 'redirects to index' do
      expect(response).to redirect_to(projects_path)
    end
  end

  describe 'DELETE destroy' do
    let!(:project) do
      Project.create(
        name: 'some name',
        description: 'some description',
        priority: 1.4
      )
    end

    before { delete :destroy, params: { id: project.id } }

    it 'deletes @project' do
      expect(Project.exists?(project.id)).to be(false)
    end

    it 'redirects to index' do
      expect(response).to redirect_to(projects_path)
    end
  end
end
