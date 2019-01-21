require 'rails_helper'

feature 'User sess own todos' do
  scenario "user does not see others' todos" do
    Todo.create!(title: 'Todo Title', email: 'someone_else@example.com')

    sign_in_as 'me@example.com'

    expect(page).not_to display_todo('Todo Title')
  end
end

