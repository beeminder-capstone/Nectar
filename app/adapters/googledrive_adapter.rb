class GoogledriveAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.google.com/drive/"
    end

    def title
      "Google Drive"
    end
  end
end
