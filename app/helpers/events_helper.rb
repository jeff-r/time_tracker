module EventsHelper
  def duration_in_hours(minutes)
    if minutes
      "%.2f" % (minutes/60.0)
    else
      "Zero"
    end
  end

  def formatted_duration(event)
    if event.seconds
      "#{formatted_time(event.start_time)} - #{formatted_time(event.end_time)} ... %d minutes" % [event.seconds/60]
    else
      seconds = Time.now - event.start_time
      "#{formatted_time(event.start_time)} - now ... %d minutes" % (seconds / 60)
    end
  end

  def formatted_duration_event(event)
    if event.seconds
      "%.2f hours" % (event.seconds/3600.0)
    else
      seconds = Time.now - event.start_time
      "%.2f - running" % (seconds / 3600.0)
    end
  end

  def formatted_time(time)
    time.strftime("%I:%M")
  end
end
