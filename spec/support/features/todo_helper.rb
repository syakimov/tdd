module Features
  def create_todo(todo_title)
    click_on 'Add a new todo'
    fill_in 'Title', with: todo_title
    click_on 'Submit'
  end

  def display_todo(title)
    have_css '.todos li', text: title
  end

  def display_completed_todo(title)
    have_css '.todos li.completed', text: title
  end
end
