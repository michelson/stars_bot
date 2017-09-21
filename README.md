# StarsBot

## Install

+1 checkout the repo 
+2 add an `.env` file in the root of the folder with the following:

```
SLACK_API_TOKEN=your-slack-token
CHECK_EVERY=10
NOTIFY_WITH=10 
```

## Run the application

```ruby
gem install foreman
bundle install
foreman start
```

## Deploy

`heroku config:add TZ="America/Santiago"`
`heroku config:set SLACK_API_TOKEN=your-slack-token`
`heroku config:set CHECK_EVERY=10`
`heroku config:set NOTIFY_WITH=10`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


