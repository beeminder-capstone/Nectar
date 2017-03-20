=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:quizlet).register_metric :answers do |metric|
  metric.title = "Answer count"
  metric.description = "Number of answered questions"

  metric.block = proc do |adapter|
    Datapoint.new(value: adapter.answer_count)
  end
end
