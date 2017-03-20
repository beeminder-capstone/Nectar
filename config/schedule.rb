=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

require "whenever"

set :output, "#{path}/log/cron_log.log"
set :environment, @environment

every '55 * * * *' do
  runner "BeeminderWorker.perform_async"
end

