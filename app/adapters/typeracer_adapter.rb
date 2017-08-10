=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class TyperacerAdapter < BaseAdapter
  class << self
    def required_keys
      %i(uid)
    end

    def auth_type
      :none
    end

    def website_link
      "http://typeracer.com"
    end

    def title
      "Typeracer"
    end

    def note
      ""
    end
  end

  def client
    TypeRacer::Client.new(uid)
  end

  delegate :completed_games, to: :client

  def self.valid_credentials?(credentials)
    uid = credentials.fetch(:uid)
    return false if uid.empty?
    !!TypeRacer::Client.new(uid)
  rescue TypeRacer::Api::UserNotFound, KeyError
    false
  end

  def uid
    credentials.fetch :uid
  end
end
