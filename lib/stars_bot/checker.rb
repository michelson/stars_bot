module StarsBot

  class Checker

    def self.fetch(date, time)
      list = StarsBot::Queries.query(StarsBot::Queries::IndexQuery)
      
      timeslots = list.data.all_time_slots.detect do |o|
        o.start == time && o.date == date
      end

      $client.chat_postMessage(
        channel: '#general', 
        text: 'Hello World 222', 
        as_user: true)

    end

  end

end