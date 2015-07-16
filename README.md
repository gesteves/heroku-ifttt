# Heroku-IFTTT deploy hook

Use IFTTT as a Heroku deploy hook.


## Installation

First, go to the [Maker channel](https://ifttt.com/maker) on IFTTT and connect it.

Then, push this button [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy) to create a new Heroku app.

Finally, go to any other Heroku app for which you wish to notify IFTTT when they're deployed, and add an HTTP deploy hook pointing to `https://[URL]/ifttt/[your Maker secret key]`, where `[URL]` is the URL of the Heroku app you just created, and your Maker key is the one you can get from the [Maker channel]([Maker channel](https://ifttt.com/maker), like so:

```shell
heroku addons:add deployhooks:http --url=https://your-ifttt-heroku-app.herokuapp.com/ifttt/abc_123_whatever
```

IFTTT will get notified whenever the app is deployed, which you can use as a trigger when setting up IFTTT recipes. When creating a new recipe, use `heroku_deploy` as the event name. `value1` is the notification text and `value2` is the URL of the app; you can use these values in the actions channel.
