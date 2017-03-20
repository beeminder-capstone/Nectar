=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
PROVIDERS.fetch(:facebook).register_metric :total_posts_per_day do |metric|
  metric.description = "Sum of POSTS made by user per day"
  metric.title = "Facebook posts per day"

  metric.block = proc do |adapter|
    #Get the user's wall from facebook (first 100 items)
    # wall = @client.get_connections("me", "feed", fields: %w(id from created_time))
    # adapter.create_post
    # adapter.test_adapter
    # adapter.fetch_wall
    # puts adapter.fetch_me
    # puts adapter.fetch_wall
    # puts adapter.fetch_wall.count(&:id)
    puts adapter.fetch_my_days_posts


    Datapoint.new(value: adapter.fetch_wall.count(&:id))
    # wall = adapter.fetch_wall

    # Use this line if comparing profiles directly doesn't work
    # me_id = @client.get_object("me")/{profile=>id}


    #Get the user's profile
    # me = @client.get_object("me")

    # wall.each {|p| get_my_days_posts(p, me)}

    #We need to get the posts that are the users
    # Where the creator of the post is equal to the user's profile


    # Only need this line if user is posting 100+ a day
    # next_wall = wall.next_page

  # end.map do |ts, value|
  #   Datapoint.new(unique: true, timestamp: ts, value: value)
  # end.sort_by(&:timestamp)
  end



end


