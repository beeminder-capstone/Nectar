class WikipediaAdapter < BaseAdapter
  class << self
    def required_keys
      %i(uid)
    end

    def auth_type
      :none
    end

    def website_link
      "https://en.wikipedia.org/wiki/Main_Page"
    end

    def title
      "Wikipedia"
    end

    def note
      ""
    end

    def valid_credentials?(credentials)
      uid = credentials.fetch(:uid)
      uid.present?
    end
  end

  def edit_count
    resp = Faraday.get("https://en.wikipedia.org/w/api.php?action=query&list=users&ususers=#{uid}&usprop=editcount&format=json")

    user_info = JSON.parse(resp.body)["query"]["users"]&.first
    if user_info
      user_info.fetch("editcount")
    else
      raise "Can't fetch edit count"
    end
  end

end
