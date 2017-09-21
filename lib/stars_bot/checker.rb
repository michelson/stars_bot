module StarsBot
  class Checker
    def self.fetch(date, time)

      list = $store.fetch('list', StarsBot::Queries.query(StarsBot::Queries::IndexQuery).original_hash, expires: 300)
      
      timeslots = list['data']["allTimeSlots"].detect do |o|
        # get timeslots that starts in ten or less minutes
        d = ENV['TEST_MODE'] == 1 ? date : o['date']
        puts "#{d} #{o['start']} -- #{date} #{time}"
        
        @minutes = (Time.parse("#{d} #{o['start']}") - Time.parse("#{date} #{time}") ) / 60 
        @minutes <= 10 && @minutes >= 0
      end

      return if timeslots.blank?

      timeslots['talkSet'].each do |talk|
        # ensure one notification only per id
        next if $store['ids'].include?(talk['id'])
        $store['ids'] = $store['ids'] << talk['id']

        $client.chat_postMessage(
          channel: '#general', 
          text: self.message_format(talk), 
          as_user: true)
      end
    end

    def self.message_format(talk)
      category  = nil
      speaker   = nil
      room      = nil

      if talk['category'].present?
        category = "que habla acerca de _#{talk['category']}_"
      end

      if talk['speaker'].present?
        speaker = "una charla de (*#{talk['speaker']['name']})* #{category}"
      end

      if talk['room'].present?
        room = "en sala `#{talk['room']}`:"
      end
   
      "Atentos, ya empieza #{room} \"*#{talk['name'].upcase}*\" #{speaker} en menos de #{@minutes.to_i} minutos"
  
    end
  end
end