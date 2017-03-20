=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

class AddMetricKeyToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :metric_key, :string
    Goal.find_each do |goal|
      p goal.credential_id
      goal.update metric_key: goal.credential.provider.metrics.first.key
    end
    change_column :goals, :metric_key, :string,  null: false
    add_index :goals, :metric_key
  end
end
