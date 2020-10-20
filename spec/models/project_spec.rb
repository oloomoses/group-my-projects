require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:user) do
    User.create!(
                  name: 'name',
                  username: 'username',
                  email: 'username@example.com'
                )
  end

  describe 'association' do
    it { should belong_to(:user) }
  end

  context 'name validation' do
    it { should validate_presence_of(:name)}
    it { should validate_length_of(:name).is_at_most(20)}
  end

  context 'time validation' do
    it { should validate_presence_of(:time) }    
  end
end
