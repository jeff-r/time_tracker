module Services
  class Histogram
    attr_reader :histogram

    def initialize(minutes_per_bucket)
      @seconds_per_bucket = minutes_per_bucket * 60
      @histogram = {}
    end

    def make_histogram(heartbeats)
      heartbeats.each do |hearbeat|
        add_hearbeat hearbeat
      end
      with_formatted_dates
    end

    def bucket_times
      @histogram.keys
    end

    def with_formatted_dates
      formatted_histogram = {}
      bucket_times.each do |time|
        time_string = time.localtime.strftime("%F %T")
        formatted_histogram[time_string] = @histogram[time]
      end
      formatted_histogram
    end

    private

    def increment_last_bucket
      @histogram[bucket_times.last] += 1
    end

    def add_hearbeat(heartbeat)
      if bucket_times.empty?
        @histogram[heartbeat.created_at] = 1
      elsif new_bucket?(heartbeat)
        add_bucket_and(heartbeat)
      else
        increment_last_bucket
      end
    end

    def new_bucket?(heartbeat)
      heartbeat.created_at > bucket_times.last + @seconds_per_bucket
    end

    def add_bucket_and(heartbeat)
      while bucket_times.last + @seconds_per_bucket < heartbeat.created_at do
        @histogram[bucket_times.last + @seconds_per_bucket] = 0
      end
      increment_last_bucket
    end
  end
end
