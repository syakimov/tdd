require 'rails_helper'

feature 'User visits homepage' do
  scenario 'successfully' do
    # You can use rails helpers. Equivallent to '/'
    visit root_path

    expect(page).to have_css 'h1', text: 'Todos'
  end
end
