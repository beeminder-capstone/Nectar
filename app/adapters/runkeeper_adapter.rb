class RunkeeperAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://runkeeper.com/"
    end

    def title
      "RunKeeper"
    end
  end
end
