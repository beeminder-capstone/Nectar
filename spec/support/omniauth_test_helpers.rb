=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

module OmniauthTestHelpers
  FAKE_AUTH_ATTR = {
    "uid" => "mock_uid",
    "user_info" => {
      "name" => "mockuser",
      "image" => "mock_user_thumbnail_url",
    },
    "credentials" => {
      "token" => "mock_token",
      "secret" => "mock_secret",
    },
  }.freeze
  def mock_auth(provider = :beeminder)
    OmniAuth.config.mock_auth = {}
    OmniAuth.config.mock_auth[provider] = FAKE_AUTH_ATTR.merge(
      "provider" => provider.to_s
    )
  end

  def mock_current_user(user = build_stubbed(:user))
    allow_any_instance_of(ApplicationController).to(
      receive(:current_user).and_return(user)
    )
    user
  end
end
