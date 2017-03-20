=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

class AddTimestampsToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :created_at, :datetime
    add_column :goals, :updated_at, :datetime
  end
end
