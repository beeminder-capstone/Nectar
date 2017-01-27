PROVIDERS.fetch(:facebook).register_metric :total_posts_per_day do |metric|
  metric.description = "Sum of POSTS made by user per day"
  metric.title = "POSTS backlog"

  metric.block = proc do |adapter|
    #insert code here
  end
end
