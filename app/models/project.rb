class Project < ApplicationRecord
  has_many :events

  def start_clock
    events.create start_time: Time.now
  end
end
