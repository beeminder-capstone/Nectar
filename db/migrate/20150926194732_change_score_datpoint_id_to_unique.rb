=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

class ChangeScoreDatpointIdToUnique < ActiveRecord::Migration
  def change
    add_column :scores, :unique, :boolean
    Score.update_all(unique: false)
    Score.where.not(datapoint_id: nil).update_all(unique: true)
    remove_column :scores, :datapoint_id
    change_column_null :scores, :unique, true
  end
end
