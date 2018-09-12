module Services
  class Summarizer
    def summarize_day(day)
      project_ids = Project.all.pluck(:id)
      grouped_events = Event.where("project_id in (?)", project_ids).group("date(start_time)").group(:project_id).sum(:seconds)
      result = {}
      grouped_events.each do |date_and_id, seconds|
        date,project_id = date_and_id
        if result[date]
          result[date] << {project_id: project_id, seconds: seconds}
        else
          result[date] = [{project_id: project_id, seconds: seconds}]
        end
      end
      result
    end
  end
end


# ap Event.group("date(start_time)").group(:project_id).sum(:seconds)
# [ "2018-09-08", 298486374 ] => 120,
# [ "2018-09-08", 980190962 ] => 420,
# [ "2018-09-09", 298486374 ] => 120

