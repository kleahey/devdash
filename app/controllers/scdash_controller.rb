class ScdashController < ApplicationController
  def show
    @activeAppTickets = Scdash.app_active
    @solvedAppTickets = Scdash.app_solved
    @activeRecTickets = Scdash.rec_active
    @solvedRecTickets = Scdash.rec_solved
  end
end
