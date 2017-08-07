# create an example post using factory_girl
# visit the root route
# click on the image to 'show' the individual post
# click on the 'Edit Post' button to enter the edit view
# click on the 'Delete Post' button
# expect to be routed to the root again.
# expect to see the message "Problem solved!  Post deleted."
# expect to not see the old post anymore.

require "rails_helper.rb"
require "helpers/helpers.rb"
require "selenium-webdriver"

feature 'Deleting memes' do

  scenario 'Can delete a meme', :js => true do
    meme = create(:meme, :view_date => Time.zone.today)

    visit memes_path

    page.accept_confirm do
      find('.fa.fa-trash').click
    end

    expect(page).to have_content("Meme was successfully deleted.")
  end
end
