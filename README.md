[![Build Status](https://travis-ci.org/beeminder-capstone/Nectar-Backend.svg?branch=master)](https://travis-ci.org/beeminder-capstone/Nectar-Backend)
# Nectar Backend
Backend for Nectar app

Nectar adds support for more integrations on [Beeminder](https://www.beeminder.com/). Automatically gets data from supported integrations and adds it to Beeminder goals.

This is a work in progress. Available for testing at: [https://beemindernectar.herokuapp.com/](https://beemindernectar.herokuapp.com/).

Requires Ruby 2.3.3 or greater, [Rails](http://guides.rubyonrails.org/getting_started.html) 5.0.0.1 or greater and [PostgreSQL](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup) 9.1 or greater. Must set all environment variables listed in: `.env.local`.

##Supported integrations
* Beeminder
* Austin Bcycle
* Bitbucket
* Blogger
* Dropbox
* Evernote
* Facebook
* Fitbit
* Flickr
* GitHub
* Gmail
* Google Calendar
* Google Drive
* Google Fit
* Google+
* Google Tasks
* Instagram
* KhanAcademy
* LinkedIn
* Microsoft Office365
* Moves
* Pocket
* Quizlet
* Remember The Milk
* RunKeeper
* Slack
* Strava
* Trello
* Tumblr
* Twitter
* Typeracer
* Wunderlist
* YouTube

Most of these integrations do not yet have metrics to track.

Adapted from [Gal Tsubery's](https://github.com/tsubery/) [Quantifier](https://github.com/tsubery/quantifier/).
