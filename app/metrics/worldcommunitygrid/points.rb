PROVIDERS.fetch(:worldcommunitygrid).register_metric :points do |metric|
  metric.title = "Total Points Generated"
  metric.description = "Total Points Generated statistic."

  metric.block = proc do |adapter|
    Datapoint.new value: adapter.points
  end
end
