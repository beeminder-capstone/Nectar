# Be sure to restart your server when you modify this file.

=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:password]
