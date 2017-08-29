App.scdash = App.cable.subscriptions.create('ScdashChannel', {
  received: function(data) {
    $("#solvedAppTickets").removeClass("hidden")
    return $("#solvedAppTickets").text(this.renderMessage(data));
  }

  renderMessage: function(data) {
    return data.solved_app_tickets
  }
});
