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
end
