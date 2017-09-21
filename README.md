# StarsBot

## Install

+ checkout the repo 
+ add an `.env` file in the root of the folder with the following:


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

set up this config variables in order to make the bot work

`heroku config:add TZ="America/Santiago"`

`heroku config:set SLACK_API_TOKEN=your-slack-token`

`heroku config:set CHECK_EVERY=10`

`heroku config:set NOTIFY_WITH=10`

and push to heroku

`git push heroku master`


## example

![image](https://user-images.githubusercontent.com/11976/30684707-b78b0fc0-9e88-11e7-9612-5611c3090ed7.png)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


