require 'rails_helper'

feature 'User creates todo' do
  scenario 'successfully' do
    sign_in

    create_todo('Todo content')

    expect(page).to display_todo('Todo content')
  end
end
