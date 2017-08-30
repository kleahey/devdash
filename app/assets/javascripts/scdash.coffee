# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  setInterval () ->
    a = $('#solvedAppTickets').text()
    b = $('#solvedRecTickets').text()
    c = parseInt(a)
    d = parseInt(b)
    e = c + d
    $('#totalInterations').text(e)
  , 2000
