require 'test_helper'

class ActiveProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
    @old_event = @project.events.create(start_time: 2.weeks.ago)
    @recent_event = @project.events.create(start_time: 2.days.ago)
  end

  test "returns the events for the current week" do
    assert_equal @recent_event.id, @project.current_weeks_events.first.id
  end
end
