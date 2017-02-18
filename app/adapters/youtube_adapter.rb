class YoutubeAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.youtube.com/"
    end

    def title
      "YouTube"
    end
  end
end
