require "ostruct"

class ProjectsHelperTest < ActionView::TestCase
  test "returns the correct CSS class" do
    event = OpenStruct.new(is_running?: true)
    assert_equal "project-event running", event_row_class(event)
    event = OpenStruct.new(is_running?: false)
    assert_equal "project-event not-running", event_row_class(event)
  end
end
