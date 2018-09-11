require 'test_helper'

class BeforeSaveEventTest < ActiveSupport::TestCase
  test "sets the duration before saving" do
    project = projects :one
    event = project.events.create start_time: 1.minute.ago
    event.end_time = Time.now
    event.save
    assert_equal 60, event.seconds
  end
end
