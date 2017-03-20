require "quizlet/client"
=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class QuizletAdapter < BaseAdapter
  class << self
    def required_keys
      %i(token uid)
    end

    def auth_type
      :oauth
    end

    def website_link
      "https://quizlet.com"
    end

    def title
      "Quizlet"
    end
  end

  def client
    Quizlet::Client.new access_token: access_token
  end

  def statistics
    client.get("users/#{uid}", {}).fetch("statistics")
  end

  def session_count
    statistics.fetch("study_session_count")
  end

  def answer_count
    statistics.fetch("total_answer_count")
  end
end
