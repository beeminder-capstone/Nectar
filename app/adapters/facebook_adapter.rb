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
    puts 'before user'
    client.get_connection('me', 'feed', fields: %w(id from created_time))
  end


  def fetch_me
    client.get_object("me")
  end


  #returns posts created by the user
  def fetch_my_days_posts()
    wall = fetch_wall

    wall.each do |post|
      puts 'print post from'
      puts post.from
      post.from === fetch_me
    end.count()

  end

  def create_post
    #Test message to see if this works
    client.put_connections("me", "feed", message: "hi all")
  end

end

