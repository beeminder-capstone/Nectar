class InstagramAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.instagram.com/"
    end

    def title
      "Instagram"
    end
  end
end
