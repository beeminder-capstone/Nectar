class GoogleplusAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://plus.google.com"
    end

    def title
      "Google+"
    end
  end
end
