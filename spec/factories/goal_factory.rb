# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  credential_id :integer          not null
#  slug          :string           not null
#  last_value    :float
#  params        :json             not null
#  metric_key    :string           not null
#  active        :boolean          default(TRUE), not null
#  fail_count    :integer          default(0), not null
#
=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

FactoryGirl.define do
  factory :goal do
    slug { |i| "slug_#{i}" }
    metric_key :article_days_linear
    credential
  end
end
