class Event < ApplicationRecord
  belongs_to :project

  def duration
    if is_running?
      "#{current_duration_in_minutes} minutes and counting"
    else
      "#{current_duration_in_minutes} minutes"
    end
  end

  def formatted_time
    start_time.localtime.strftime("%b %e, %l:%M %p")
  end

  def time_and_duration
    "#{duration}: #{formatted_time}"
  end

  def is_running?
    end_time.nil?
  end

  private

  def current_duration_in_minutes
    final = is_running? ? Time.now : end_time
    seconds = (final - start_time)
    (seconds/60).to_i
  end
end
