require "trello"

=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

class TrelloAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token secret)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://trello.com"
    end

    def title
      "Trello"
    end
  end

  def client
    Trello::Client.new(
      consumer_key: Rails.application.secrets.trello_provider_key,
      consumer_secret: Rails.application.secrets.trello_provider_key,
      oauth_token: access_token,
      oauth_token_secret: access_secret
    )
  end

  def cards(list_ids)
    list_ids.flat_map do |list_id|
      client.find(:list, list_id).cards.map(&:itself)
    end
  end

  def list_options
    client.find(:member, uid).boards(filter: :open).flat_map do |b|
      b.lists.map do |list|
        joined_name = [b.name, list.name].join("/")
        [joined_name, list.id]
      end
    end
  end
end
