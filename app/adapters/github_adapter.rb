class GithubAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://github.com/"
    end

    def title
      "GitHub"
    end
  end
end
