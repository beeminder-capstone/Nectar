PROVIDERS = %i(
    beeminder bcycle bitbucket blogger dropbox_oauth2 evernote facebook fitbit flickr github gmail googlecalendar googledrive googlefit googleplus googletasks instagram khan_academy linkedin microsoft_office365 moves pocket quizlet rememberthemilk runkeeper slack strava trello tumblr twitter typeracer wunderlist youtube
).map do |p_key|
    adapter = "#{p_key}_adapter".camelize.constantize
    [p_key, Provider.new(p_key, adapter)]
end.to_h.with_indifferent_access
PROVIDERS.values.each(&:load_metrics)
