[![Build Status](https://travis-ci.org/beeminder-capstone/Nectar-Backend.svg?branch=master)](https://travis-ci.org/beeminder-capstone/Nectar-Backend)
[![Dependency Status](https://www.versioneye.com/user/projects/58acea064ca76f0047de1862/badge.svg?style=flat)](https://www.versioneye.com/user/projects/58acea064ca76f0047de1862)

# Nectar Backend

Copyright © 2017 The [PSU](https://www.pdx.edu/) [CS](https://www.pdx.edu/computer-science/) Beeminder [Capstone](http://wiki.cs.pdx.edu/capstone/fall_2016/fall_2016.html) Team

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


## Idea
The idea behind the Nectar Backend is to provide a server for the Nectar Frontend Mobile app, that integrates naturally with the Beeminder website.

## Usage
This app allows the user to do the following things for their Beeminder account

 * View a Goal
 * Add integration to a goal
 

## Supported Integrations
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
* Stack Overflow
* Strava
* Trello
* Tumblr
* Twitter
* Typeracer
* Wikipedia
* World Community Grid
* Wunderlist
* YouTube

Most of these integrations do not yet have metrics to track.


## Build
The following instructions will enable you to download and compile the source into a working server:


1. Install Ruby: [https://www.ruby-lang.org/en/documentation/installation/](https://www.ruby-lang.org/en/documentation/installation/)
    1. Requires version 2.3.3 or greater (because of this: [https://en.wikipedia.org/wiki/Safe_navigation_operator#Ruby](https://en.wikipedia.org/wiki/Safe_navigation_operator#Ruby)).
    2. Note: If you are using Windows, we would highly recommend you use Bash on Windows 10 ([https://msdn.microsoft.com/en-us/commandline/wsl/install_guide](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)) and then follow the Linux instructions. If you install on windows, use the RailsInstaller to install both Ruby and Rails: [http://railsinstaller.org/en](http://railsinstaller.org/en). Here are some links to help solve some of the problems you may encounter:
        1. [http://stackoverflow.com/a/35730896](http://stackoverflow.com/a/35730896)
        2. [http://blog.cloud-mes.com/2014/08/19/how-to-install-gem-curb-in-windows/](http://blog.cloud-mes.com/2014/08/19/how-to-install-gem-curb-in-windows/)
        3. [http://curl.haxx.se/dlwiz/?type=lib&os=Win32&flav=-](https://web.archive.org/web/20150520184140/http://curl.haxx.se/dlwiz/?type=lib&os=Win32&flav=-)
2. Install Rails: http://guides.rubyonrails.org/getting_started.html#installing-rails
    1. Requires version 5.0.0.1 or greater.
3. Install PostgreSQL: [https://devcenter.heroku.com/articles/heroku-postgresql#local-setup](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup)
    1. Requires version 9.1 or greater.
4. Setup PostgreSQL by opening the GUI. Create the "nectar_development" database.
5. Download the files: [https://github.com/beeminder-capstone/Nectar-Backend](https://github.com/beeminder-capstone/Nectar-Backend) and CD into the directory.
6. Set all environment variables listed in: `.env.local`.
    1. The top three from the bottom are required.
    2. Get the `SECRET_KEY_BASE` by running: `rake secret`.
7. Run: `bundle install`. (On Windows or Mac follow the instructions on the top of this file to install the pg gem: [config/database.yml](config/database.yml).)
8. Run: `rake db:migrate`.
9. Start the server: `bin/rails server` (on Windows: `ruby bin\rails server`).
10. Go to: [http://localhost:3000/](http://localhost:3000/).

## Contributing
To contribute, simply fork and then create a pull request. 

## License
##### Copyright © 2017 The [PSU](https://www.pdx.edu/) [CS](https://www.pdx.edu/computer-science/) Beeminder [Capstone](http://wiki.cs.pdx.edu/capstone/fall_2016/fall_2016.html) Team
This code is available under the "MIT License".
Please see the file LICENSE in this distribution for license terms.

Adapted from [Gal Tsubery's](https://github.com/tsubery/) [Quantifier](https://github.com/tsubery/quantifier/).
