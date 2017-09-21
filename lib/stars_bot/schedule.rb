module StarsBot
  class Schedule
    include Celluloid
    attr_reader :date, :time, :timer

    def initialize
      @fired = false
      perform
    end

    def perform
      @timer = after(ENV['CHECK_EVERY'].to_i) do 
        @date = Date.today.to_s
        @time = ENV['NOTIFY_WITH'].to_i.minutes.from_now.strftime("%H:%M:%S")
        puts "Timer fired for: #{date}, #{time}"
        self.fetch_time_slots
      end
    end

    def fetch_time_slots
      StarsBot::Checker.fetch(@date, @time)
      self.perform
    end

  end
end