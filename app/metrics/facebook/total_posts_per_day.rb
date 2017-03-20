
PROVIDERS.fetch(:facebook).register_metric :total_posts_per_day do |metric|
  metric.description = "Sum of POSTS made by user per day"
  metric.title = "Facebook posts per day"

  metric.block = proc do |adapter|
    Datapoint.new(value: adapter.fetch_my_days_posts)

  # end.map do |ts, value|
  #   Datapoint.new(unique: true, timestamp: ts, value: value)
  # end.sort_by(&:timestamp)
  end



end


