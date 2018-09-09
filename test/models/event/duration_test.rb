require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = events :one
  end

  test "returns the duration in printable form" do
    assert_equal "36 minutes", @event.duration
  end

  test "returns current duration if clock is still running" do
    project = projects :one
    event = project.events.create start_time: 8.minutes.ago
    assert_equal "8 minutes and counting", event.duration
  end
end
