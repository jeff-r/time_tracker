require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = events :one
  end

  test "returns the start time in printable form" do
    assert_equal "Sep  8,  5:00 PM", @event.formatted_time
  end

  test "returns the time and duration" do
    assert_equal "36 minutes: Sep  8,  5:00 PM", @event.time_and_duration
  end
end

