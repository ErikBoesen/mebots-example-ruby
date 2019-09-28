# Sample GroupMe Ruby Bot using MeBots
[**Python**](https://github.com/ErikBoesen/mebots-example-python) | [**JavaScript**](https://github.com/ErikBoesen/mebots-example-javascript) | **Ruby**

## Introduction

A simple GroupMe bot that reacts to messages sent within a group, designed to demonstrate the [MeBots](http://mebots.co) API and serve as a template for other bots.

Please see [this tutorial](https://github.com/ErikBoesen/bot-tutorial-python) for general information about how to set up a Python bot, including Heroku setup instructions.

Documentation of the MeBots API can be found [here](http://mebots.co/documentation).

## Setup
Open `bot.rb` in your favorite editor and find the line where the bot is instantiated:
```rb
BOT = Bot.new("your_bot_shortname_here", ENV["BOT_TOKEN"])
```
Replace `your_bot_shortname_here` with the shortname of your bot, which is visible while editing your bot on the MeBots web interface.

Then, set the `BOT_TOKEN` environment variable in your shell to the token available in the bot editing panel.
```sh
export BOT_TOKEN=0123456789abcdef
```
Or on Heroku:
```sh
heroku config:set BOT_TOKEN=0123456789abcdef
```

## Author
[Erik Boesen](https://github.com/ErikBoesen)
