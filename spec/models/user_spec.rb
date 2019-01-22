require 'rails_helper'

describe User, '#todos' do
  it 'returns all todos with user email' do
    user = User.new('someone@example.com')

    Todo.create!(email: user.email)
    Todo.create!(email: user.email)

    expect(user.todos.count).to eq 2
  end
end

describe User, '#signed_in?' do
  it 'returns true when user has email' do
    expect(User.new('someone@example.com').signed_in?).to be true
  end

  it 'returns true when user has email' do
    expect(User.new(nil).signed_in?).to be false
  end
end
