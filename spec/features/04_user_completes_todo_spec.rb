require 'rails_helper'

feature 'User completes todo' do
  scenario 'successfully' do
    sign_in

    create_todo('Todo content')

    click_on 'Mark complete'

    expect(page).to display_completed_todo 'Todo content'
  end
end
