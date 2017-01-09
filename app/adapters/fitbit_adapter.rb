class FitbitAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.fitbit.com/"
    end

    def title
      "Fitbit"
    end
  end
end
