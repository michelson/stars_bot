# StarsBot

StarsBot is my implementation for slackbot on Synaptic StarsConf Challenge, 
This bot implements a checking of talks and will notify to slack via `PushMessage` to slack channel minutes before the beginning of the talk.

This implementation has a simple in memory cache system in order to avoid hit GraphQl intensively in each check, with a 300 TTL. The checking interval and notification time window are configurables. Also This application has a "test mode" in with the bot will notify every day a the given talk start time.

## Install

+ checkout the repo 
+ add an `.env` file in the root of the folder with the following:

### Development environment only

```
SLACK_API_TOKEN=your-slack-token
CHECK_EVERY=10
NOTIFY_WITH=10 
TEST_MODE=1
```

## Run the application

```ruby
gem install foreman
bundle install
foreman start
```

## Run test

`bundle exec rspec`

## Deploy to Heroku

set up this config variables in order to make the bot work

`heroku config:add TZ="America/Santiago"`

`heroku config:set SLACK_API_TOKEN=your-slack-token`

`heroku config:set CHECK_EVERY=10`

`heroku config:set NOTIFY_WITH=10`

`heroku config:add TEST_MODE=1` 

and push to heroku

`git push heroku master`

**NOTE:** the variable TEST_MODE=1 will send notifications every day without comparing day, if the TEST_MODE sets to 0, the application will compare the day and send the notification for the specific day

**NOTE 2:** In order to deploy in heroku and avoid idling on free plan set a monitoring service for the application, go to: `https://elements.heroku.com/addons/newrelic`


## example

![image](https://user-images.githubusercontent.com/11976/30684707-b78b0fc0-9e88-11e7-9612-5611c3090ed7.png)


## Bonus track:

there is an slack commands ready to be implemented in `stars_bot/commands/hello.rb` file, just try `@yourbot hi` or `How is the weather in Chile?`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


