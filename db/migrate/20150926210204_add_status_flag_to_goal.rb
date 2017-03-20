=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

class AddStatusFlagToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :active, :boolean, default: true, null: false
    add_column :goals, :fail_count, :integer, default: 0, null: false
  end
end
