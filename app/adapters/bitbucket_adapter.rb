class BitbucketAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://bitbucket.org/"
    end

    def title
      "Bitbucket"
    end
  end
end
