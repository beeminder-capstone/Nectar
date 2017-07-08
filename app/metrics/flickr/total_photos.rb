=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:flickr).register_metric :total_photos do |metric|
  metric.description = "Total Photos."
  metric.title = "Photos Count"

  metric.block = proc do |adapter|
    Datapoint.new(value: adapter.fetch_photos)
  end

end


