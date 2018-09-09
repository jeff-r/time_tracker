require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @project = projects :one
  end

  test "returns true if running" do
    @project.start_clock
    assert_equal true, @project.events.last.is_running?
  end

  test "returns false if not running" do
    assert_equal false, @project.events.last.is_running?
  end
end
