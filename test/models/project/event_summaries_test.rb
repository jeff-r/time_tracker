require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects :one
    @summaries = @project.event_summaries
  end

  test "returns the summaries" do
    expected = [
      {'2018-09-08' => 420},
      {'2018-10-08' => 360}
    ]
    assert_equal expected, @summaries
  end
end


