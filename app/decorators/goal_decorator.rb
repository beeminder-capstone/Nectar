=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class GoalDecorator < DelegateClass(Goal)
  include ActionView::Helpers::UrlHelper
  # nclude ActionView::Helpers::AssetTagHelper

  def status
    active ? "Enabled" : "Disabled"
  end

  def last_score
    score = scores.order(:timestamp).last
    score.nil? ? "none" : score.value
  end

  def beeminder_link(beeminder_user_id)
    link_to slug, "https://www.beeminder.com/#{beeminder_user_id}/goals/#{slug}"
  end

  def delete_link
    link_to "Delete",
            routes.goal_path(self),
            method: :delete,
            "data-confirm": "Are you sure?",
            class: %i(btn btn-default)
  end

  def safe_fetch_scores
    fetch_scores
  rescue => e
    Rails.logger.error e.inspect
    Rails.logger.error e.backtrace
    msg = "Could not fetch scores."
    if e.is_a? BaseAdapter::AuthorizationError
      msg += " Please authorize again"
    end
    [OpenStruct.new(timestamp: "now", value: msg)]
  end

  def metric_link(id)
    title = metric.title
    link_to title,
            "/goals/#{provider.name}/#{metric.key}/#{id}",
            title: "Click to configure goal"
  end
  
  def provider_link
    title = provider.title
    link_to title,
            "/credentials/#{provider.name}",
            title: "Click to configure provider"
  end

  private

  def routes
    Rails.application.routes.url_helpers
  end
end
