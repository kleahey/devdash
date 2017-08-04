class TodayController < ApplicationController
  def index
    @meme = Meme.where(view_date: Time.zone.today)
  end
end
