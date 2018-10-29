class Project < ApplicationRecord
  has_many :events

  def current_weeks_events
    # events.select { |event| event.start_time > Date.today.at_beginning_of_week}
    events
  end

  def event_summaries
    summaries = {}
    events.each do |event|
      next if event.end_time.nil?
      date_string = event.start_time.strftime("%Y-%m-%d")
      if summaries[date_string]
        summaries[date_string] += event.seconds/60.0
      else
        summaries[date_string] = event.seconds/60.0
      end
    end
    summaries = summaries.map do |key, value|
      OpenStruct.new(date: key, total_minutes: value)
    end
    summaries
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
