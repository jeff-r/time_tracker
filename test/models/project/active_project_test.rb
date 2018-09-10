require 'test_helper'

class ActiveProjectTest < ActiveSupport::TestCase
  test "returns true if any project is running" do
    project = projects :one
    project.start_clock
    assert_equal project.id, Project.active_project.id
  end

  test "returns nil if no project is running" do
    assert_nil Project.active_project
  end
end
