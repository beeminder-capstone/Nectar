=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:bcycle).register_metric :trip_durations do |metric|
  metric.title = "Trip duration"
  metric.description = "Duration of trips in minutes"

  metric.block = proc do |adapter|
    adapter.statistics_for_last.map do |ts, data|
      Datapoint.new(
        unique: true,
        timestamp: ts,
        value: data.fetch(:duration)
      )
    end
  end
end
