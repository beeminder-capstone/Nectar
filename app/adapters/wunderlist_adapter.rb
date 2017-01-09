class WunderlistAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.wunderlist.com/"
    end

    def title
      "Wunderlist"
    end
  end
end
