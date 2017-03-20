=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
module Repo
  def find(key)
    collection[key.to_sym]
  end

  def find!(key)
    known_key = key.respond_to?(:to_sym) && collection.key?(key.to_sym)
    raise "Unknown key #{key}" unless known_key
    find(key)
  end

  def store(key, object)
    return nil if key.nil?
    collection[key.to_sym] = object
  end

  delegate :keys, to: :collection

  private

  def collection
    @collection ||= {}
  end
end
