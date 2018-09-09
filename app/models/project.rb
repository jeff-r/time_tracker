class Project < ApplicationRecord
  has_many :events

  def start_clock
    events.create start_time: Time.now
  end

  def stop_clock
    event = events.last
    return if event.end_time
    event.update_attributes(end_time: Time.now)
  end

  def is_running?
    events.last.is_running?
  end
end
