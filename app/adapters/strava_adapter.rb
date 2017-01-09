class StravaAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.strava.com/"
    end

    def title
      "Strava"
    end
  end
end
