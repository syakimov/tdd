# README

You will get familiar with the following Rails DSL.
root to: 'controller#action'
resources :controller_name, only: [:action1, action2] -> the helpers are plural
resource :controller_name, only: [:action1, action2] -> the helpers are singular

simple_form_for :params_key do |form|
  form.input :field
  form.button :submit, 'Submit text'
end
rails g model ModelName field_name # field_name will be string
params.require(:resource_name).permit(:field)
`<ul class='class-name'></ul>` create an unordered list
`<li> <%= model.field %> </li>` create list item
`<% @model_collection.each do |model| %>` -> iterate over collection of models
`before_action :method_name` -> executes before each action. Good for
redirections and authentications.
`rails g migration add_field_to_table` -> generate migration
`add_column :table, :field, :type` -> add column to table
`touch :completed_at` -> update the column with the current time


This is a TDD Rails exsersize based on https://thoughtbot.com/upcase/test-driven-rails

Remove `skip` from feature tests one by one and make them green.


## Tips and tricks section
Go to this section if you get stuck with some implementation

### First test
Fairly easy one
1. Start by creating root path in the routes.rb file
2. Follow the errors until you get to the point where the error says:
     `Failure/Error: expect(page).to have_css 'h1', text: 'Todos'
       expected to find css "h1" but there were no matches`
3. You can add this to the TodosController, but better choose a more generic
   place. (app/views/layouts/application.html.erb)


### Second test

#### Part one
We want to first create a Todo without dealing with sign in. Start by
uncommenting `visit root_path` and commenting `sign_in`.

1. Go to the view and create a link. Think about the route helper. Ask your self
   should it be singular or plural?
2. Add the route as rspec will scream about "undefined variable or method"
3. Create the controller -> action -> view
4. Create a form for todo
  4.1 Start with :todo symbol instead of Todo model
  4.2 Add `url: todos_path` to the form
5. Add a POST route -> action
6. The create action
   The Rails way says create action does not have a view. You create the
   resource and redirect depending on resource creation success.
   On success you redirect to #index and on failure to #new flashing errors.

   6.1. Add redirection to #index (root_path)
   6.2. Add Todo model, skip the spec generation
   6.3. Create a Todo resource in the #create action
   6.4. Add @todos in #index action and render it in a list in the #index

   Refactoring
   6.5. Replace the :todo symbol with an instance @todo
   `bundle exec rspec spec` will fail with Todo model specs but the first two
   `bundle exec rspec spec/features` should be green and the others should be skipped

#### Part two
Now we want first to sign in and then create a todo. We do not yet link the
Todo model to the user. Start by commenting `visit root_path` and uncommenting `sign_in`.

1. Force user to authenticate (add before_action to TodosController)
2. Add #authenticate in ApplicationController
   2.1. The method should redirect to 'sessions#new' if the user is not signed_in?
   2.2. Add #signed_in? in the ApplicationController that always return false
3. Add the missing route (think about weather it is singular or plural)
4. Add controller -> action -> template
5. Add the sign in form in the view
6. Set the url to point to 'sessions#create'
7. Add the route -> action
8. Implement sign in logic
   8.1. ApplicationController#signed_in? (check for email in the session)
   8.2. In #create assign the user email in the session
   8.3. In #create redirect to the beginning of the application

Now the first two feature tests should pass and the others are skipped.

### Third test

1. Add email field to the Todo model
   Generate migration -> fill the migration -> run the migration
2. Limit the todos shown to user in the #index action
3. The second test must fail now. In the #create action specify the email.


### Fourth test

1. Add button in the li to point to the 'completions#create'
2. Add the route under the todo routes
3. Add the controller -> action
4. Complete the todo in the action
5. Generate migration -> fill the -> run it
6. Render the todos with conditional completion class in #index
7. Implement Todo#complete?
8. In the 'completions#create' redirect to root
9. All spec should either pass or be skipped

### Fifth test
1. In the 'todos#index' view render conditionally buttons for completion and incompletion
2. Add route > action
3. Mark todo incomplete in the action and redirect to root
4. Now we have failing unit and feature specs (Nice!)
   Implement `todo#mark_incomplete!`
