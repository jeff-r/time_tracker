require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects :one
  end

  test "returns true if running" do
    @project.start_clock
    assert_equal true, @project.is_running?
  end

  test "returns false if not running" do
    assert_equal false, @project.is_running?
  end

  test "returns fals if no events" do
    assert_equal false, Project.new.is_running?
  end
end

