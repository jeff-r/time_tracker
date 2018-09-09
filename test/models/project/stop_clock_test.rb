require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects :one
    @project.start_clock
  end

  test "sets end_time on last event" do
    now = DateTime.now
    Timecop.freeze now do
      @project.stop_clock
      assert_equal @project.events.last.end_time.to_i, now.to_i
    end
  end

  test "doesn't update end_time if it's already set" do
    now = DateTime.now
    Timecop.freeze now do
      @project.events.last.update_attributes(end_time: 1.minute.ago)
      @project.stop_clock
      assert_equal @project.events.last.end_time.to_i, 1.minute.ago.to_i
    end
  end
end
