class EvernoteAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://evernote.com/"
    end

    def title
      "Evernote"
    end
  end
end
