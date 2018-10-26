require 'test_helper'

class HeartbeatsControllerTest < ActionDispatch::IntegrationTest
  test "heartbeat_mouse creates a heartbeat object" do
    assert_difference("Heartbeat.count") do
      get heartbeat_mouse_url
    end
  end

  test "index assigns @heartbeats" do
    Heartbeat.create(heartbeat_type: "mouse")
    get heartbeats_url
    assert_equal 1, assigns(:heartbeats).length
  end

  test "Returns the heartbeats as json" do
    heartbeat = Heartbeat.create(heartbeat_type: "mouse")
    get heartbeats_url, format: :json
    json = JSON.parse(response.body)
    assert_equal heartbeat.id, json.first["id"]
  end
end
