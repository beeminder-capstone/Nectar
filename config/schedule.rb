require "whenever"

set :output, "#{path}/log/cron_log.log"
set :environment, @environment

every '55 * * * *' do
  runner "BeeminderWorker.perform_async"
end

