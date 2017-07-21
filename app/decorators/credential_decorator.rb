=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class CredentialDecorator < DelegateClass(Credential)
  def connected_as
    info["email"] || info["nickname"] || info["name"] || uid
  end

  def status
    if connected_as.present?
      "Connected as #{connected_as}"
    else
      "Click to connect"
    end
  end
end
