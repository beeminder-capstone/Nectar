PROVIDERS.fetch(:worldcommunitygrid).register_metric :results do |metric|
  metric.title = "Total Results Returned"
  metric.description = "Total Results Returned statistic."

  metric.block = proc do |adapter|
    Datapoint.new value: adapter.results
  end
end
