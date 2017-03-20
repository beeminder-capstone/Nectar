=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class BaseAdapter
  InvalidCredentials = Class.new(StandardError)
  AuthorizationError = Class.new(StandardError)

  def initialize(credentials)
    @credentials = credentials.with_indifferent_access
    validate_credentials!
  end

  def self.valid_credentials?(credentials)
    credentials.values_at(*required_keys).all?(&:present?)
  end

  private

  attr_reader :credentials
  def required_keys
    raise NotImplementedError
  end

  def validate_credentials!
    valid = self.class.valid_credentials?(credentials)
    raise(InvalidCredentials, credentials.to_s) unless valid
  end

  def access_token
    credentials.fetch :token
  end

  def access_secret
    credentials.fetch :secret
  end

  def uid
    credentials.fetch :uid
  end
end
