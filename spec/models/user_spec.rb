require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures user is valid' do
      user = User.new(name: 'username', username: 'user1', email: 'user@example.com').save
      expect(user).to eq(true)
    end

    it 'ensures name is present' do
      user = User.new(name: nil)
      expect(user.save).to eq(false)
    end

    it 'ensures username is present' do
      user = User.new(username: nil).save
      expect(user).to eq(false)
    end

    it 'ensures username is not too long' do
      user = User.new(username: 'a' * 21).save
      expect(user).to eq(false)
    end

    it 'ensures username is unique' do
      user1 = User.create(username: 'username')

      user = User.new(username: 'username').save
      expect(user).to eq(false)
    end

    it 'ensures email is present' do
      user = User.new(name: 'username', username: 'user1', email: nil).save
      expect(user).to eq(false)
    end

    it 'ensures email is valid' do
      
    end

    it 'ensures email is unique' do
      user1 = User.create(name: 'username', username: 'user1', email: 'user@example.com')

      user = User.new(name: 'user', username: 'userme', email: 'user@example.com').save
      expect(user).to eq(false)

    end

    it 'ensures name is not too long' do
      user = User.new(name: 'a' * 21)
      expect(user.save).to eq(false)
    end
  end
end
