=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
require "trello" # it is not required by default for some reason

class BeeminderWorker
  include Sidekiq::Worker

  def perform(beeminder_user_id: nil, goal_id: nil)
    if goal_id
      filter = { id: goal_id }
    elsif beeminder_user_id
      filter = { users: { beeminder_user_id: beeminder_user_id } }
    else
      filter = {}
    end


    Goal.where(active: true)
        .joins(:user)
        .joins(:credential)
        .where(filter)
        .order("credentials.provider_name = 'beeminder' ASC")
        .find_each(&method(:safe_sync))
  end

  private

  def safe_sync(goal)
    Timeout::timeout(90) {
      goal.sync
    }
  rescue => e
    Rollbar.error(e, goal_id: goal.id)
    logger.error e.backtrace
    logger.error e.inspect
    goal.update fail_count: (goal.fail_count + 1)
  end
end
