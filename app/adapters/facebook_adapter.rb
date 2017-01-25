class FacebookAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.facebook.com/"
    end

    def title
      "Facebook"
    end
  end
end

def client
  Koala::Facebook::Api.new(
      oath_access_token: Rails.application.secrets.facebook_provider_key,
      app_secret: Rails.application.secrets.facebook_secret_key
  )
end
