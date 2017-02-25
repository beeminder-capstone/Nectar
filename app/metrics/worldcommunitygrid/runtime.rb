PROVIDERS.fetch(:worldcommunitygrid).register_metric :runtime do |metric|
  metric.title = "Total Run Time"
  metric.description = "Total Run Time statistic (in seconds)."

  metric.block = proc do |adapter|
    Datapoint.new value: adapter.runtime
  end
end
