=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class Datapoint
  attr_reader :timestamp, :value, :id, :unique, :comment_prefix
  include Comparable

  alias eql? ==

  def initialize(id: nil, unique: false, timestamp: nil,
                 value:, comment_prefix: "")
    @id = id.to_s
    @timestamp = timestamp
    @value = value.to_d
    @unique = unique
    @comment_prefix = comment_prefix
  end

  def to_beeminder
    comment = ""
    if comment_prefix.present?
      comment += "#{comment_prefix} "
    end
    comment += "🐝 Nectar "
    if timestamp.present?
      comment += "for #{timestamp} "
    end
    comment += "@ #{Time.current}"
    
    Beeminder::Datapoint
      .new value: value,
           timestamp: timestamp,
           comment: comment
  end

  def <=>(other)
    return nil unless other.instance_of?(self.class)
    @value.<=>(other.value) if @id == other.id && @timestamp == other.timestamp
  end

  def hash
    [self.class, @id, @timestamp, @value].hash
  end
end
