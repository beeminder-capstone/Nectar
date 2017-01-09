class GoogletasksAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://mail.google.com/tasks"
    end

    def title
      "Google Tasks"
    end
  end
end
