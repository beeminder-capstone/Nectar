class KhanAcademyAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://www.khanacademy.org/"
    end

    def title
      "KhanAcademy"
    end
  end
end
