class ScdashController < ApplicationController
  def show
    @activeAppTickets = Scdash.app_active["total"].to_i
    @solvedAppTickets = Scdash.app_solved["total"].to_i
    @activeRecTickets = Scdash.rec_active["total"].to_i
    @solvedRecTickets = Scdash.rec_solved["total"].to_i
    @totalAppChats = Scdash.app_chat['total'].to_i
    @totalRecChats = Scdash.rec_chat['total'].to_i
    @totalChats = @totalAppChats + @totalRecChats
    @totalInterations = @solvedAppTickets + @solvedRecTickets + @totalChats

    @ticketNameArray = Scdash.team_member_ticket_counts.sort_by {|k, v| v}.reverse
  end
end
