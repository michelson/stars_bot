
module StarsBot
  module Commands
    class Hello < SlackRubyBot::Commands::Base
      command 'hi' do |client, data, _match|
        client.say(channel: data.channel, text: 'hello madafaka')
      end

      command 'oe' do |client, data, _match|
        client.say(channel: data.channel, text: 'ao')
      end

      match /^How is the weather in (?<location>\w*)\?$/ do |client, data, match|
        client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
      end

    end
  end
end