=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

VCR.configure do |c|
  c.cassette_library_dir = "support/vcr_cassettes"
  c.hook_into :webmock
  c.ignore_hosts "codeclimate.com"
end
