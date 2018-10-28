class Project < ApplicationRecord
  has_many :events

  def current_weeks_events
    events.select { |event| event.start_time > Date.today.at_beginning_of_week}
  end

  def event_summaries
    select_string = "strftime('%Y-%m-%d', start_time)"
    events.select("#{select_string} as date", "sum(seconds)/60 as total_minutes").group("date").order("date desc")
  end

  def recent_events
    events.where("start_time > ? ", 3.days.ago).order("start_time desc")
  end

  def start_clock
    events.create start_time: Time.now
  end

  def stop_clock
    event = events.last
    return if event.end_time
    event.update_attributes(end_time: Time.now)
  end

  def is_running?
    return false if events.empty?
    events.last.is_running?
  end

  def self.active_project
    event = Event.last
    return nil if event.nil?
    if event.is_running?
      event.project
    else
      nil
    end
  end
end
