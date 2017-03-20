=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:bcycle).register_metric :trip_length do |metric|
  metric.title = "Trip length"
  metric.description = "Length of trips in miles"

  metric.block = proc do |adapter|
    adapter.statistics_for_lastmap do |ts, data|
      Datapoint.new(
        unique: true,
        timestamp: ts,
        value: data.fetch(:miles)
      )
    end
  end
end
