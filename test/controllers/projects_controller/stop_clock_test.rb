require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "stops the last event" do
    @project.start_clock
    assert_nil @project.events.last.end_time
    get stop_clock_url(id: @project.id)
    assert_not_nil @project.events.last.end_time
  end

  test "redirects to the event page" do
    get stop_clock_url(id: @project.id)
    assert_redirected_to project_path(@project)
  end
end

