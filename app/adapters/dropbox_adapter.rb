class DropboxAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.dropbox.com/"
    end

    def title
      "Dropbox"
    end
  end
end
