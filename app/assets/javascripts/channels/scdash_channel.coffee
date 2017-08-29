App.scdash = App.cable.subscriptions.create "ScdashChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $("#solvedAppTickets").text(data.solved_app_tickets);
    $("#activeAppTickets").text(data.active_app_tickets);
    $("#activeRecTickets").text(data.active_rec_tickets);
    $("#solvedRecTickets").text(data.solved_rec_tickets);
