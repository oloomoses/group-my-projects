require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures user is valid' do
      user = User.new(name: 'username').save
      expect(user).to eq(true)
    end

    it 'ensures name is present' do
      user = User.new(name: nil)

      expect(user.save).to eq(false)
    end

    it 'ensures name is not too long' do
      user = User.new(name: 'a' * 21)
      expect(user.save).to eq(false)
    end
  end
end
