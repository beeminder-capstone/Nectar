class MovesAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://moves-app.com/"
    end

    def title
      "Moves"
    end
  end
end
