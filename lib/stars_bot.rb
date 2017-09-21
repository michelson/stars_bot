require "stars_bot/version"
require 'moneta'
require 'active_support'
require 'active_support/core_ext'
require 'celluloid'
require 'slack-ruby-bot'
require 'stars_bot/commands/hello'
require 'dotenv'
Dotenv.load

module StarsBot
  autoload :API, "stars_bot/api"
  autoload :Queries, "stars_bot/queries"
  autoload :Checker, "stars_bot/checker"
  autoload :WebServer, "stars_bot/web_server"
  autoload :Schedule, "stars_bot/schedule"
  autoload :Config, "stars_bot/schedule"

  $store = Moneta.new(:Memory)
  $store['ids'] = []

  Slack.configure do |config|
    config.token = ENV['SLACK_API_TOKEN']
  end

  class SlackBot < SlackRubyBot::Bot
  end

  $client = Slack::Web::Client.new
  $client.auth_test

end
