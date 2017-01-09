PROVIDERS = %i(
    beeminder bcycle bitbucket blogger dropbox evernote facebook fitbit flickr github gmail googlecalendar googledrive googlefit googleplus googletasks instagram khanacademy linkedin microsoftoffice365 moves pocket quizlet rememberthemilk runkeeper slack strava trello tumblr twitter typeracer wunderlist youtube
).map do |p_key|
    adapter = "#{p_key}_adapter".camelize.constantize
    [p_key, Provider.new(p_key, adapter)]
end.to_h.with_indifferent_access
PROVIDERS.values.each(&:load_metrics)
