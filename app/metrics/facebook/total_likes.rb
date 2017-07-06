=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:facebook).register_metric :total_likes do |metric|
  metric.description = "Total Likes."
  metric.title = "Likes Count"

  metric.block = proc do |adapter|
    Datapoint.new(value: adapter.fetch_likes)
  end

end


