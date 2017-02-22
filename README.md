[![Build Status](https://travis-ci.org/beeminder-capstone/Nectar-Backend.svg?branch=master)](https://travis-ci.org/beeminder-capstone/Nectar-Backend)
[![Dependency Status](https://www.versioneye.com/user/projects/58acea064ca76f0047de1862/badge.svg?style=flat)](https://www.versioneye.com/user/projects/58acea064ca76f0047de1862)

# Nectar Backend
---
Copyright (c) 2017 The Beeminder Capstone Team

Backend for Nectar app

Nectar adds support for more integrations on [Beeminder](https://www.beeminder.com/). Automatically gets data from supported integrations and adds it to Beeminder goals.

This is a work in progress. Available for testing at: [https://beemindernectar.herokuapp.com/](https://beemindernectar.herokuapp.com/).

Requires Ruby 2.3.3 or greater, [Rails](http://guides.rubyonrails.org/getting_started.html) 5.0.0.1 or greater and [PostgreSQL](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup) 9.1 or greater. Must set all environment variables listed in: `.env.local`.


---

### Table of Contents
 - [Idea](#Idea)
 - [Usage](#usage)
 - [Supported Integrations](#Supported Integrations)
 - [Build](#build)
 - [Contributing](#contributing)
 - [License](#license)
 
---


##Idea
The idea the Nectar Backend is to provide a server for the Nectar Mobile app, that integrates naturally with the Beeminder website.

##Usage
This app allows the user to do the following things for their beeminder account

 * View a Goal
 * Add integration to a goal
 

##Supported Integrations
The following integrations are supported by the Nectar Backend:

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


##Build
The following instructions will enable you to download and compile the source into a working server.


2.    Install Ruby: https://www.ruby-lang.org/en/documentation/installation/
    1.    Requires version 2.3.3 or greater (because of this: https://en.wikipedia.org/wiki/Safe_navigation_operator#Ruby).
3.    Install Rails: http://guides.rubyonrails.org/getting_started.html#installing-rails
    1.    Requires version 5.0.0.1 or greater.
4.    Install PostgreSQL: https://devcenter.heroku.com/articles/heroku-postgresql#local-setup
    1.    Requires version 9.1 or greater.
5.    Setup PostgreSQL by opening the GUI. Create the "nectar_development" database.
6.    Download the files: https://github.com/beeminder-capstone/Nectar-Backend and CD into the directory.
7.    Set all environment variables listed in: `.env.local`.
    1.    The top three from the bottom are required.
    2.    Get the `SECRET_KEY_BASE` by running: `rake secret`.
8.    Run: `bundle install`. (On Windows or Mac follow the instructions on the top of this file to install the pg gem: https://github.com/beeminder-capstone/Nectar-Backend/blob/master/config/database.yml.)
9.    Run: `rake db:migrate`.
10.    Start the server: `bin/rails server` (on Windows: `ruby bin\rails server`).
11.    Go to: http://localhost:3000/.

##Contributing
To contribute, simply fork and then create a pull request. 

##License
#####Copyright (c) 2017 The Beeminder Capstone Team
This code is available under the "MIT License".
Please see the file LICENSE in this distribution for license terms.

Adapted from [Gal Tsubery's](https://github.com/tsubery/) [Quantifier](https://github.com/tsubery/quantifier/).
