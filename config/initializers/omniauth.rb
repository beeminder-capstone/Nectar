Rails.application.config.middleware.use OmniAuth::Builder do
  provider :beeminder,
           Rails.application.secrets.beeminder_provider_key,
           Rails.application.secrets.beeminder_provider_secret

  provider :pocket,
           Rails.application.secrets.pocket_provider_key

  provider :trello,
           Rails.application.secrets.trello_provider_key,
           Rails.application.secrets.trello_provider_secret,
           app_name: "Beemind.me",
           scope: "read",
           expiration: "never"

  provider :google_oauth2,
           Rails.application.secrets.google_provider_key,
           Rails.application.secrets.google_provider_secret,
           scope: %w[
             email
             fitness.fitness.activity.read
             fitness.fitness.blood_glucose.read
             fitness.fitness.blood_pressure.read
             fitness.body.read
             fitness.body_temperature.read
			 fitness.nutrition.read
			 fitness.oxygen_saturation.read
			 fitness.reproductive_health.read
           ].join(","),
           name: "googlefit",
           prompt: "consent"

  provider :quizlet,
           Rails.application.secrets.quizlet_provider_key,
           Rails.application.secrets.quizlet_provider_secret,
           :scope => "read",
           :state => SecureRandom.hex(16)
		   
  provider :bitbucket, Rails.application.secrets.bitbucket_provider_key, Rails.application.secrets.bitbucket_provider_secret
  provider :dropbox_oauth2, Rails.application.secrets.dropbox_provider_key, Rails.application.secrets.dropbox_provider_secret
  provider :facebook, Rails.application.secrets.facebook_provider_key, Rails.application.secrets.facebook_provider_secret
  provider :fitbit, Rails.application.secrets.fitbit_provider_key, Rails.application.secrets.fitbit_provider_secret, scope: "activity profile"
  provider :flickr, Rails.application.secrets.flickr_provider_key, Rails.application.secrets.flickr_provider_secret, scope: 'read'
  provider :github, Rails.application.secrets.github_provider_key, Rails.application.secrets.github_provider_secret, scope: "user,repo,gist"
  provider :instagram, Rails.application.secrets.instagram_provider_key, Rails.application.secrets.instagram_provider_secret
  provider :khan_academy, Rails.application.secrets.khan_academy_provider_key, Rails.application.secrets.khan_academy_provider_secret
  provider :linkedin, Rails.application.secrets.linkedin_provider_key, Rails.application.secrets.linkedin_provider_secret, :scope => 'r_fullprofile r_emailaddress r_network'
  provider :microsoft_office365, Rails.application.secrets.microsoft_office365_provider_key, Rails.application.secrets.microsoft_office365_provider_secret
  provider :moves, Rails.application.secrets.moves_provider_key, Rails.application.secrets.moves_provider_secret
  provider :rtm, Rails.application.secrets.rtm_provider_key, Rails.application.secrets.rtm_provider_secret
  provider :runkeeper, Rails.application.secrets.runkeeper_provider_key, Rails.application.secrets.runkeeper_provider_secret
  provider :slack, Rails.application.secrets.slack_provider_key, Rails.application.secrets.slack_provider_secret, scope: 'identity.basic'
  provider :strava, Rails.application.secrets.strava_provider_key, Rails.application.secrets.strava_provider_secret
  provider :tumblr, Rails.application.secrets.tumblr_provider_key, Rails.application.secrets.tumblr_provider_secret
  provider :twitter, Rails.application.secrets.twitter_provider_key, Rails.application.secrets.twitter_provider_secret
  provider :wunderlist, Rails.application.secrets.wunderlist_provider_key, Rails.application.secrets.wunderlist_provider_secret
  
  provider :google_oauth2,
           Rails.application.secrets.google_provider_key,
           Rails.application.secrets.google_provider_secret,
           scope: %w[
             email
             blogger.readonly
           ].join(","),
           name: "blogger",
           prompt: "consent"
  
  provider :google_oauth2,
           Rails.application.secrets.google_provider_key,
           Rails.application.secrets.google_provider_secret,
           scope: %w[
             email
             calendar.readonly
           ].join(","),
           name: "googlecalendar",
           prompt: "consent"
  
  provider :google_oauth2,
           Rails.application.secrets.google_provider_key,
           Rails.application.secrets.google_provider_secret,
           scope: %w[
             email
             drive.metadata.readonly
           ].join(","),
           name: "googledrive",
           prompt: "consent"
  
  provider :google_oauth2,
           Rails.application.secrets.google_provider_key,
           Rails.application.secrets.google_provider_secret,
           scope: %w[
             email
             gmail.metadata
           ].join(","),
           name: "gmail",
           prompt: "consent"
  
  provider :google_oauth2,
           Rails.application.secrets.google_provider_key,
           Rails.application.secrets.google_provider_secret,
           scope: %w[
             email
             plus.stream.read
			 plus.profiles.read
			 plus.circles.read
           ].join(","),
           name: "google+",
           prompt: "consent"
  
  provider :google_oauth2,
           Rails.application.secrets.google_provider_key,
           Rails.application.secrets.google_provider_secret,
           scope: %w[
             email
             tasks.readonly
           ].join(","),
           name: "googletasks",
           prompt: "consent"
  
  provider :google_oauth2,
           Rails.application.secrets.google_provider_key,
           Rails.application.secrets.google_provider_secret,
           scope: %w[
             email
             youtube.readonly
           ].join(","),
           name: "youtube",
           prompt: "consent"

end
