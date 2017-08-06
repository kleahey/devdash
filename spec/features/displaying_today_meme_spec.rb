require 'rails_helper.rb'
require 'helpers/helpers.rb'

feature 'Homepage displays today\'s meme' do
  scenario 'the homepage displays correct created post information' do
    create(:meme, view_date: Time.zone.today)

    visit '/'
    expect(page).to have_content(Time.zone.today.strftime("%A, %B %d, %Y"))
    expect(page).to have_css("img[src*='meme']")
  end
end
