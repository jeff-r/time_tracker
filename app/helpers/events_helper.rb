module EventsHelper
  def formatted_duration(minutes)
    "%.2f" % (minutes/60.0)
  end

  def formatted_time(time)
    time.strftime("%Y-%m-%d %I:%M")
  end
end
