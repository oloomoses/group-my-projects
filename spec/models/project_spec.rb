require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validation tests' do
    it 'ensures project is valid with the user id' do
      user = User.create(name: 'username')
      project = user.projects.new(name: 'forms', time: 2).save
      expect(project).to eq(true)
    end

    it 'ensures name is present' do
      user = User.create(name: 'username')
      project = user.projects.new(name: nil)
      expect(project).to be_invalid
    end

    it 'ensures time is present' do
      user = User.create(name: 'username')
      project = user.projects.new(time: nil)
      expect(project).to be_invalid
    end

  end
end
