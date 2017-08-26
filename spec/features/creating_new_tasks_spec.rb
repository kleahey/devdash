# visit the tasks index
# click on a button to create a new task
# fill out the bits of the form that we need.
# click the submit button
# expect the page that we’re sent to to have specific text
# expect the page to contain the task information

require 'rails_helper.rb'
require 'helpers/helpers.rb'
require 'faker'

feature 'Creating tasks' do

  background do
    @program = create(:program)
    @sprint = create(:sprint)
    @project = create(:project, :program_id => @program.id)

    visit tasks_path
    click_link "New Task"
  end

  scenario 'can create a new task' do
    pending "Not yet fixed"

    date = Faker::Date.between(75.days.ago, Time.zone.yesterday)
    hours = Faker::Number.decimal(1)
    select( @project.name , :from => "task_project_id" )
    select( @sprint.name , :from => "task_sprint_id" )
    select_date( date , :from => "task_historical_date" )
    fill_in 'task_task_hours', :with => hours
    click_button 'Create Task'
    expect(page).to have_content("Task was successfully created.")
    expect(page).to have_content(@project)
    expect(page).to have_content(@sprint)
    expect(page).to have_content(hours)
  end
end
