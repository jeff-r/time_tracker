class HeartbeatsController < ApplicationController
  def heartbeat_mouse
    Heartbeat.create(heartbeat_type: "mouse")
    render json: "OK"
  end

  def index
    @heartbeats = Heartbeat.all
    respond_to do |format|
        format.html { render :index }
        format.json { render json: Services::Histogram.new(15).make_histogram(@heartbeats) }
      end
  end
end
