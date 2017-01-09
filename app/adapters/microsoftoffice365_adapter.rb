class Microsoftoffice365Adapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://products.office.com/en-US/"
    end

    def title
      "Microsoft Office365"
    end
  end
end
