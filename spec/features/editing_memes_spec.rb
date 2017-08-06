# create a meme with factory_girl
# visit the memes route
# click the show icon of the post we created with factory_girl
# click the 'Edit' link
# attach a new file and select a new date
# click the ’Update Meme' button
# expect the page to have content saying "Meme was successfully updated."
# expect the page to have content saying the new date
# expect the page to have the new picture displayed

require 'rails_helper.rb'
require 'helpers/helpers.rb'

feature 'Editing memes' do
  background do
    meme = create(:meme, :view_date => Time.zone.today)

    visit memes_path
    find('i.fa.fa-eye').click
    click_link(href: edit_meme_path(meme))
  end

  scenario 'Can edit a meme' do
    attach_file('Image', "spec/files/images/meme2.jpg")
    select_date(Date.yesterday, :from => "meme_view_date")
    click_button 'Update Meme'

    expect(page).to have_content("Meme was successfully updated.")
    expect(page).to have_content(Date.yesterday.strftime("%B %d, %Y"))
    expect(page).to have_css("img[src*='meme2.jpg']")
  end
end
