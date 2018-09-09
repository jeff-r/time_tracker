require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "creates an event" do
    assert_difference 'Event.count' do
      get start_clock_url(id: @project.id)
    end
  end

  test "redirects to the event page" do
    get start_clock_url(id: @project.id)
    assert_redirected_to project_path(@project)
  end
end
