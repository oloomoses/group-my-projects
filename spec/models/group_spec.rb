require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'validation tests' do
    it 'ensures group is valid with a User' do
      user = User.create(name: 'user1', username: 'username', email: 'user1@example.com')
      group = user.groups.build(name: 'username', icon: 'icon').save
      expect(group).to eq(true)
    end

    it 'ensures group name is present' do
      user = User.create(name: 'user1', username: 'username', email: 'user1@example.com')
      group = user.groups.new(name: nil, icon: 'icon')
      expect(group.save).to eq(false)
    end

    it 'ensures group name is unique' do
      user = User.create(name: 'user1', username: 'username', email: 'user1@example.com')
      group = user.groups.create(name: 'group1', icon: 'icon1')
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
    it 'ensures group belongs to a user' do
    end

    it 'ensures group has many projects' do
    end

    it 'ensures group has many groupings' do
    end
  end
end
