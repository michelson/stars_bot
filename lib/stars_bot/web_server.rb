require 'sinatra/base'

module StarsBot
  class WebServer < Sinatra::Base
    get '/' do
      'StarsBot!'
    end
  end
end