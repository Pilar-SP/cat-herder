# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project do
  describe 'validations' do
    subject(:project) do
      described_class.create(
        name: 'title',
        description: 'description',
        priority: 1.0
      )
    end

    context 'when project name is blank' do
      before { project.name = '' }

      it 'is not valid without a name' do
        expect(project).not_to be_valid
      end
    end

    context 'when project description is blank' do
      before { project.description = '' }

      it 'is not valid without a description' do
        expect(project).not_to be_valid
      end
    end

    context 'when project priority is blank' do
      before { project.priority = nil }

      it 'is not valid without a priority' do
        expect(project).not_to be_valid
      end
    end

    context 'when project has all attributes' do
      it 'is valid' do
        expect(project).to be_valid
      end
    end
  end
end
