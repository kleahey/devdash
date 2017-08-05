require 'rails_helper.rb'
require 'helpers/helpers.rb'

feature 'Homepage displays today\'s meme' do
  scenario 'the homepage displays correct created post information' do
    post_one = create(:meme, view_date: Date.today)

    visit '/'
    expect(page).to have_content(Date.today.strftime("%A, %B %d, %Y"))
    expect(page).to have_css("img[src*='meme']")
  end
end
