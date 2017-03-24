=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

PROVIDERS = %i(
    beeminder bcycle bitbucket blogger dropbox_oauth2 evernote facebook fitbit flickr github gmail googlecalendar googledrive googlefit googleplus googletasks instagram khan_academy linkedin microsoft_office365 moves pocket quizlet rtm runkeeper slack stackoverflow strava trello tumblr twitter typeracer wikipedia worldcommunitygrid wunderlist youtube
).map do |p_key|
    adapter = "#{p_key}_adapter".camelize.constantize
    [p_key, Provider.new(p_key, adapter)]
end.to_h.with_indifferent_access
PROVIDERS.values.each(&:load_metrics)
