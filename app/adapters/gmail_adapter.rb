class GmailAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.google.com/gmail"
    end

    def title
      "Gmail"
    end
  end
end
