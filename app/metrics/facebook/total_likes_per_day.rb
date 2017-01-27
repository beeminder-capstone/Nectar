PROVIDERS.fetch(:facebook).register_metric :total_likes_per_day do |metric|
  metric.description = "Sum of LIKES made by user per day"
  metric.title = "LIKES backlog"

  metric.block = proc do |adapter|
    #insert code here
  end
end
