module EventsHelper
  def formatted_duration(minutes)
    "%.2f" % (minutes/60.0)
  end
end
