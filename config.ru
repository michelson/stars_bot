#$LOAD_PATH.unshift(File.dirname(__FILE__))

Bundler.require(:default, :development)

require 'dotenv'
Dotenv.load

require 'stars_bot'

Thread.abort_on_exception = true

Thread.new do
  begin
    StarsBot::SlackBot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

#Thread.new do
  StarsBot::Schedule.new
#end

run StarsBot::WebServer