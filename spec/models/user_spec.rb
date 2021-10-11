# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Model validations' do
    it 'should have name' do
      user = User.new(name: nil, email: 'oksana@mail.com', password: '111111').save
      expect(user).to eq(false)
    end

    it 'should have email' do
      user = User.new(name: 'OKsana', email: nil, password: '111111').save
      expect(user).to eq(false)
    end

    it 'should have password' do
      user = User.new(name: 'OKsana', email: 'oksana@mail', password: nil).save
      expect(user).to eq(false)
    end

    it 'should create successfully' do
      user = User.new(name: 'Oksana', email: 'oksana@mail.com', password: '111111').save
      expect(user).to eq(true)
    end
  end
end
