
PROVIDERS.fetch(:facebook).register_metric :total_posts_per_day do |metric|
  metric.description = "Sum of POSTS made by user per day"
  metric.title = "POSTS backlog"

  metric.block = proc do |adapter|
    wall = @client.get_connections("me", "feed", fields: ['id'])
    wall.each {|p| get_my_days_posts(p)}
    next_wall = wall.next_page
  end

  def get_my_days_posts(post)
    puts(post.id)
  end
end
