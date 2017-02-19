require 'koala'

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

  def fetch_wall()
    client.get_connection('me', 'feed', fields: %w(id from created_time))
  end


  def fetch_me
    client.get_object("me")
  end


  #returns posts created by the user
  def fetch_my_days_posts()
    wall = fetch_wall
    sum = 0
    wall.each do |post|
       sum += (post.from === fetch_me && !(DateTime.jisx0301(post.created_time) < Date.today)) ? 1 : 0
    end
    sum
  end

  def blah
    1

  end

  def create_post
    #Test message to see if this works
    client.put_connections("me", "feed", message: "hi all")
  end

end

