class GooglecalendarAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.google.com/calendar"
    end

    def title
      "Google Calendar"
    end
  end
end
