# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ProjectsController do
  describe 'POST create' do
    context 'with valid params' do
      let(:request) do
        post :create, params:
        { name: 'Fix table',
          description: 'Table has 2 broken legs',
          priority: 1.2 }
      end

      it 'creates new project' do
        expect { request }.to change(Project, :count).by(1)
      end

      it 'responds with a created status' do
        request
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      let(:request) do
        post :create, params:
        { name: 'Fix table',
          description: nil,
          priority: 1.0 }
      end

      it 'does not create new project' do
        expect { request }.not_to change(Project, :count)
      end

      it 'responds with json errors' do
        request
        expect(response.body).to include('errors')
      end

      it 'responds with unprocessable status' do
        request
        expect(response).to be_unprocessable
      end
    end
  end
end
