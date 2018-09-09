require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects :one
  end

  test "creates an event" do
    assert_difference('Event.count') do
      @project.start_clock
    end
  end

  test "sets start_time on created test" do
    now = DateTime.now
    Timecop.freeze now do
      @project.start_clock
      assert_equal @project.events.last.start_time.to_i, now.to_i
    end
  end

  test "leaves end_time blank on created test" do
    @project.start_clock
    assert_nil @project.events.last.end_time
  end
end

