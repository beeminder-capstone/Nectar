PROVIDERS.fetch(:facebook).register_metric :total_logins_per_day do |metric|
  metric.description = "Sum of LOGINS made by user per day"
  metric.title = "LOGINS backlog"

  metric.block = proc do |adapter|
    #insert code here
  end



end
