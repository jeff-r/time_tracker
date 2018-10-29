require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects :one
    @summaries = @project.event_summaries
  end

  test "returns the summaries" do
    expected = [
      OpenStruct.new({date: '2018-10-08', total_minutes: 6.0}),
      OpenStruct.new({date: '2018-09-08', total_minutes: 7.0})
    ]
    assert_equal expected, @summaries
  end
end


