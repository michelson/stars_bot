module StarsBot
  class Checker
    def self.fetch(date, time)

      #list = StarsBot.store || (StarsBot.store=StarsBot::Queries.query(StarsBot::Queries::IndexQuery))
      list = $store.fetch('list', StarsBot::Queries.query(StarsBot::Queries::IndexQuery).original_hash, expires: 300)

      #(Time.parse("2017-11-04 15:00:00") - Time.parse("2017-11-04 14:51:00") ) / 60
      
      timeslots = list['data']["allTimeSlots"].detect do |o|
        # get timeslots that starts in ten or less minutes
        puts "#{o['date']} #{o['start']} -- #{date} #{time}"
        #@minutes = (Time.parse("#{o['date']} #{o['start']}") - Time.parse("#{date} #{time}") ) / 60 
        # TEST MODE:
        @minutes = (Time.parse("#{date} #{o['start']}") - Time.parse("#{date} #{time}") ) / 60 

        @minutes <= 10 && @minutes >= 0
      end

      return if timeslots.blank?

      timeslots['talkSet'].each do |talk|
        
        next if $store['ids'].include?(talk['id'])
        $store['ids'] = $store['ids'] << talk['id']
        
        $client.chat_postMessage(
          channel: '#general', 
          text: self.message_format(talk), 
          as_user: true)
      end
    end

    def self.message_format(talk)
      category = nil
      speaker = nil
      room = nil
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