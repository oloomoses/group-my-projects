require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'validation tests' do
    it 'ensures group name is present' do
      user = User.create(name: 'user1', username: 'username', email: 'user1@example.com')
      group = user.groups.new(name: nil, icon: 'icon')
      expect(group.save).to eq(false)
    end

    it 'ensures group name is unique' do
      user = User.create(name: 'user1', username: 'username', email: 'user1@example.com')
      user.groups.create(name: 'group1', icon: 'icon1')
      group = user.groups.new(name: 'group1', icon: 'icon')
      expect(group.save).to eq(false)
    end

    it 'ensures group name is not too long' do
      user = User.create(name: 'user1', username: 'username', email: 'user1@example.com')
      group = user.groups.new(name: 'a' * 21, icon: 'icon')
      expect(group.save).to eq(false)
    end
  end

  context 'Association tests' do
    it {should belong_to(:user)}
    it {should have_many(:projects)}
  end
end
