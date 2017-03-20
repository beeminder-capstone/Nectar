# == Schema Information
#
# Table name: credentials
#
#  id                :integer          not null, primary key
#  beeminder_user_id :string           not null
#  provider_name     :string           not null
#  uid               :string           default(""), not null
#  info              :json             not null
#  credentials       :json             not null
#  extra             :json             not null
#  created_at        :datetime
#  updated_at        :datetime
#  password          :string           default(""), not null
#
=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

FactoryGirl.define do
  factory :credential do
    user
    provider_name :pocket
    uid { |i| "uid_#{i}" }
    credentials(token: "token")
  end
end
