require 'test_helper'

class HistogramTest < ActiveSupport::TestCase
  def setup
    @histogram = Services::Histogram.new(60)
    Timecop.freeze(Time.new(2018,10,26,10,12,48)) do
      Heartbeat.create(heartbeat_type: "mouse")
      Heartbeat.create(heartbeat_type: "mouse", created_at: 1.minute.from_now)
      Heartbeat.create(heartbeat_type: "mouse", created_at: 2.minutes.from_now)
      Heartbeat.create(heartbeat_type: "mouse", created_at: 59.minutes.from_now)

      Heartbeat.create(heartbeat_type: "mouse", created_at: 61.minutes.from_now)
      Heartbeat.create(heartbeat_type: "mouse", created_at: 62.minutes.from_now)
    end
    @histogram.make_histogram Heartbeat.all
  end

  def test_make_histogram
    assert_equal [4,2], @histogram.histogram.values
  end

  def test_with_formatted_dates
    assert_equal ({"2018-10-26 10:12:48"=>4, "2018-10-26 11:12:48"=>2}), @histogram.with_formatted_dates
  end
end

