require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is valid with a username, email, and password' do
    user = User.new(username: 'Example', email: 'example@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(username: 'Example', email: nil, password: 'password')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = User.new(username: 'Example', email: 'example@example.com', password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email' do
    User.create(username: 'John Doe', email: 'john.doe@example.com', password: 'password')
    user = User.new(username: 'John Doe', email: 'john.doe@example.com', password: 'password')
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

end

