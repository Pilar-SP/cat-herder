# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task do
  let!(:project) { Project.create(name: 'Project 1', description: 'Secret project', priority: 1.0) }

  describe 'validations' do
    subject(:task) do
      described_class.new(
        name: 'some title',
        description: 'some description',
        priority: 1.0,
        project_id: project.id
      )
    end

    context 'when task name is blank' do
      before { task.name = '' }

      it 'is not valid without a name' do
        expect(task).not_to be_valid
      end
    end

    context 'when task description is blank' do
      before { task.description = '' }

      it 'is not valid without a description' do
        expect(task).not_to be_valid
      end
    end

    context 'when task priority is blank' do
      before { task.priority = nil }

      it 'is not valid without a priority' do
        expect(task).not_to be_valid
      end
    end

    context 'when task contains all attributes' do
      it 'is valid' do
        expect(task).to be_valid
      end
    end
  end
end
