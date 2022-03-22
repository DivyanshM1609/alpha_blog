require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures not empty username' do
      user = User.new(username:'', email:'divyansh@gmail.com').save
      expect(user).to eq(false)
    end

    it 'ensure uniqueness of email' do
      user1 = User.new(username:'divya1', email:'divyansh@gmail.com').save
      user2 = User.new(username:'divya2', email:'divyansh@gmail.com').save
      expect(user2).to eq(false)
    end

  end

end
