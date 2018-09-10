module ProjectsHelper
  def event_row_class(event)
    if event.is_running?
      "project-event running"
    else
      "project-event not-running"
    end
  end
end
