PROVIDERS.fetch(:wikipedia).register_metric :edit_count do |metric|
  metric.title = "Edit Count"
  metric.description = "The number of edits made."

  metric.block = proc do |adapter|
    Datapoint.new value: adapter.edit_count
  end
end
