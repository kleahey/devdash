require 'rails_helper.rb'
require 'helpers/helpers.rb'

# visit the root route
# click on a button to create a new post
# fill out the bits of the form that we need.
# click the submit button
# expect the page that we’re sent to to have specific text
# expect the page to contain our photo.

feature 'Creating memes' do
  scenario 'can create a meme' do
    visit '/memes'
    click_link 'New Meme'
    attach_file('Image', "spec/files/images/meme.png")
    select_date( Time.zone.today , :from => "meme_view_date")
    click_button 'Create Meme'
    expect(page).to have_content(Time.zone.today.strftime("%B %d, %Y"))
    expect(page).to have_css("img[src*='meme.png']")
    expect(page).to have_content("Meme was successfully posted.")
  end
  it 'needs an image to create a post' do
    visit '/memes'
    click_link 'New Meme'
    select_date( Time.zone.today , :from => "meme_view_date")
    click_button 'Create Meme'
    expect(page).to have_content("You must attach an image!")
  end
end
