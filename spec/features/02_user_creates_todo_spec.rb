require 'rails_helper'

feature 'User creates todo' do
  skip scenario 'successfully' do
    # First implement without sign_in
    # visit root_path
    sign_in

    create_todo('Todo content')

    expect(page).to display_todo('Todo content')
  end
end
