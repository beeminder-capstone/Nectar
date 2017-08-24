require 'koala'

=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

class FacebookAdapter < BaseAdapter

  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.facebook.com/"
    end

    def title
      "Facebook"
    end
  end


  def client
    @client = Koala::Facebook::API.new(access_token)
  end


  #returns posts created by the user
  def fetch_posts()
    #wall = client.get_connection('me', 'posts', fields: %w(id from))
    wall = client.get_connection('me', 'posts', limit: 1000, fields: %w(id))
	#me = client.get_object("me")
    sum = 0
	while wall.to_a.any? do
      #wall.each do |post|
        #sum += (post.from === me) ? 1 : 0
		sum += wall.count
      #end
	  wall = wall.next_page
	end
    sum
  end
  
  def fetch_likes()
    wall = client.get_connection('me', 'likes', limit: 1000, fields: %w(id))
    sum = 0
	while wall.to_a.any? do
      sum += wall.count
      
	  wall = wall.next_page
	end
	
	wall = client.get_connection('me', 'og.likes', limit: 1000, fields: %w(id))
	while wall.to_a.any? do
      sum += wall.count
      
	  wall = wall.next_page
	end
    sum
  end
  
  def fetch_friends()
    wall = client.get_connection('me', 'friends').raw_response["summary"]["total_count"]
  end

end

