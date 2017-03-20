=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:facebook).register_metric :total_likes_per_day do |metric|
  metric.description = "Sum of LIKES made by user per day"
  metric.title = "LIKES backlog"

  metric.block = proc do |adapter|
    #insert code here
  end
end
