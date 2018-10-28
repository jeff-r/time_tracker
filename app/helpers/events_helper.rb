module EventsHelper
  def formatted_duration(minutes)
    if minutes
      "%.2f" % (minutes/60.0)
    else
      "none"
    end
  end

  def formatted_duration_seconds(seconds)
    if seconds
      "%.2f hours" % (seconds/3600.0)
    else
      "running"
    end
  end

  def formatted_time(time)
    time.strftime("%Y-%m-%d %I:%M")
  end
end
