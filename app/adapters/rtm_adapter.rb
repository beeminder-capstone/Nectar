=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class RtmAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.rememberthemilk.com/"
    end

    def title
      "Remember The Milk"
    end
  end
  
  def client
    client = Milkman::Client.new api_key: Rails.application.secrets.rtm_provider_key, shared_secret: Rails.application.secrets.rtm_provider_secret, auth_token: access_token
  end
end
