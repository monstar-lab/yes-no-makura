class TotalChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'total:editnum'
  end

  def unsubscribed
  end


end
