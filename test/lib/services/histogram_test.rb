require 'test_helper'

class HistogramTest < ActiveSupport::TestCase
  def setup
    @histogram = Services::Histogram.new(60)
    Timecop.freeze do
      Heartbeat.create(heartbeat_type: "mouse")
      Heartbeat.create(heartbeat_type: "mouse", created_at: 1.minute.from_now)
      Heartbeat.create(heartbeat_type: "mouse", created_at: 2.minutes.from_now)
      Heartbeat.create(heartbeat_type: "mouse", created_at: 59.minutes.from_now)

      Heartbeat.create(heartbeat_type: "mouse", created_at: 61.minutes.from_now)
      Heartbeat.create(heartbeat_type: "mouse", created_at: 62.minutes.from_now)
    end
  end

  def test_make_histogram
    @histogram.make_histogram Heartbeat.all
    assert_equal [4,2], @histogram.histogram.values
  end
end

