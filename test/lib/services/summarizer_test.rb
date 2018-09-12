require 'test_helper'

class SummarizerTest < ActiveSupport::TestCase
  def setup
    @project1 = projects :one
    @project2 = projects :two
    @day = DateTime.new 2018,9,8
    @summarizer = Services::Summarizer.new
  end

  def test_summarizes_by_day
    expected = {
      "2018-09-08" => [{project_id: @project2.id, seconds: 120}, {project_id: @project1.id, seconds: 420}],
      "2018-09-09" => [{project_id: @project2.id, seconds: 120}]
    }
    assert_equal expected, @summarizer.summarize_day(@day)
  end
end
