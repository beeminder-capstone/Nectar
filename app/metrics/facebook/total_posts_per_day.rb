=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:facebook).register_metric :total_posts_per_day do |metric|
  metric.description = "Sum of POSTS made by user per day"
  metric.title = "Facebook posts per day"

  metric.block = proc do |adapter|
    Datapoint.new(value: adapter.fetch_my_days_posts)
  end

end


