
PROVIDERS.fetch(:facebook).register_metric :total_posts_per_day do |metric|
  metric.description = "Sum of POSTS made by user per day"
  metric.title = "POSTS backlog"

  metric.block = proc do |adapter|
    wall = @client.get_connections("me", "feed", fields: %w(id from created_time))
    # me_id = @client.get_object("me")/{profile=>id}
    @client.put_connection("me", "feed", message: "hi all")
    me = @client.get_object("me")
    wall.each {|p| get_my_days_posts(p, me)}
    # next_wall = wall.next_page
  end

  def get_my_days_posts(post, me)
    if post.from.equal?(me)
      puts 'it works'
    end
  end
end
