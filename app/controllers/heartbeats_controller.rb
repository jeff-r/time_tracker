class HeartbeatsController < ApplicationController
  def heartbeat_mouse
    Heartbeat.create(heartbeat_type: "mouse")
    render json: "OK"
  end

  def index
    @heartbeats = Heartbeat.all
    render json: @heartbeats
  end
end
