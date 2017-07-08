=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:twitter).register_metric :total_tweets do |metric|
  metric.description = "The number of Tweets (including retweets) issued by the user."
  metric.title = "Tweets Count"

  metric.block = proc do |adapter|
    Datapoint.new(value: adapter.fetch_statuses)
  end

end


