class LinkedinAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.linkedin.com/"
    end

    def title
      "LinkedIn"
    end
  end
end
