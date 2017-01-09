class FacebookAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.facebook.com/"
    end

    def title
      "Facebook"
    end
  end
end
