class SlackAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://slack.com/"
    end

    def title
      "Slack"
    end
  end
end
