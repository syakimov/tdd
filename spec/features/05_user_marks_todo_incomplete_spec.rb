require 'rails_helper'

feature 'User marks todo incomplete' do
  scenario 'successfully' do
    sign_in

    create_todo('Todo content')

    click_on 'Mark complete'
    click_on 'Mark incomplete'

    expect(page).not_to display_completed_todo 'Todo content'
    expect(page).to display_todo 'Todo content'
  end
end
