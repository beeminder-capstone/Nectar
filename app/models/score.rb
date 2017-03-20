# == Schema Information
#
# Table name: scores
#
#  id         :integer          not null, primary key
#  value      :float            not null
#  timestamp  :datetime         not null
#  goal_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  unique     :boolean
#
=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

class Score < ActiveRecord::Base
  belongs_to :goal

  def to_datapoint
    Datapoint.new(
      timestamp: timestamp,
      value: value,
      unique: unique
    )
  end
end
