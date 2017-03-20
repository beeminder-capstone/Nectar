=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class Metric
  attr_reader :key, :block
  attr_accessor :block, :description, :title, :configuration
  attr_writer :param_errors

  def initialize(key)
    @key = key
    @configuration = proc { [] }
    @param_errors = proc { [] }
  end

  def call(*args)
    block.call(*args)
  end

  def param_errors(params)
    @param_errors.call(params)
  end

  def valid?
    [key, block, description, title].all?
  end
end
