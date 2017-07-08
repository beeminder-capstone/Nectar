require "twitter"

=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class TwitterAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://twitter.com/"
    end

    def title
      "Twitter"
    end
  end
  
  def client
	client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = Rails.application.secrets.twitter_provider_key
	  config.consumer_secret     = Rails.application.secrets.twitter_provider_secret
	  config.access_token        = access_token
	  config.access_token_secret = access_secret
	end
  end
  
  def fetch_likes
    client.user.favourites_count
  end
  
  def fetch_friends
    client.user.friends_count
  end
  
  def fetch_statuses
    client.user.statuses_count
  end
end
