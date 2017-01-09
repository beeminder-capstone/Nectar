class BloggerAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.blogger.com"
    end

    def title
      "Blogger"
    end
  end
end
