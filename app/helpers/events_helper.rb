module EventsHelper
  def formatted_duration(minutes)
    if minutes
      "%.2f" % (minutes/60.0)
    else
      "Zero"
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
