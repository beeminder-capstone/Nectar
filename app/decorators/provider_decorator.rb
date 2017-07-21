=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class ProviderDecorator < DelegateClass(Provider)
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper

  attr_accessor :credential

  delegate :status, to: :credential

  def initialize(object, credential = nil)
    super(object)

    credential ||= Credential.new
    self.credential = CredentialDecorator.new(credential)
  end

  def credential_link
    if credential?
	  "/credentials/#{name}"
    else
      routes.new_credential_path(provider_name: name)
    end
  end

  def credential?
    credential.persisted?
  end

  def metric_links
    metrics.map do |metric|
      link_to metric.title,
              metric_path(metric),
              title: metric.description + ". Click to add or configure."
    end
  end

  def metric_path(metric)
    routes.new_goal_path(provider_name: name, metric_key: metric.key)
  end

  private

  def routes
    Rails.application.routes.url_helpers
  end
end
