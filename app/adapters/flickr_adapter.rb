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
end
