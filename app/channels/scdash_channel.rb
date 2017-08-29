class ScdashChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'scdash'
  end
end
