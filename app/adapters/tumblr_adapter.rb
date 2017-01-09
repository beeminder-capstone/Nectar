class TumblrAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.tumblr.com/"
    end

    def title
      "Tumblr"
    end
  end
end
