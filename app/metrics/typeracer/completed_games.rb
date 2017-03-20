=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:typeracer).register_metric :completed_games do |metric|
  metric.title = "Completed Games"
  metric.description = "Number of completed games"

  metric.block = proc do |adapter|
    Datapoint.new value: adapter.completed_games
  end
end
