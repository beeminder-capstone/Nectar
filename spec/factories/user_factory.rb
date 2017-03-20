# == Schema Information
#
# Table name: users
#
#  beeminder_user_id :string           not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#
=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

FactoryGirl.define do
  factory :user do
    beeminder_user_id { SecureRandom.hex(8) }
  end
end
