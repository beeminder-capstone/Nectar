=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:twitter).register_metric :total_followings do |metric|
  metric.description = "The number of users this account is following (AKA their “followings”)."
  metric.title = "Followings Count"

  metric.block = proc do |adapter|
    Datapoint.new(value: adapter.fetch_friends)
  end

end


