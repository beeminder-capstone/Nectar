require 'flickraw'

=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class FlickrAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.flickr.com/"
    end

    def title
      "Flickr"
    end
  end
  
  def client
    FlickRaw.api_key = Rails.application.secrets.flickr_provider_key
	FlickRaw.shared_secret = Rails.application.secrets.flickr_provider_secret
	
	flickr = FlickRaw::Flickr.new
	flickr.access_token = access_token
	flickr.access_secret = access_secret
	
	flickr
  end
  
  def fetch_photos
    flickr = client
    info = client.people.getInfo(:user_id => client.test.login.id)
	info.photos.count
  end
end
