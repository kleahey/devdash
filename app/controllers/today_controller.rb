class TodayController < ApplicationController
  def index
    @meme = Meme.where(view_date: Date.today)
  end
end
