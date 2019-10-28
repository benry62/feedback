json.extract! note, :id, :text,  :is_archive
json.url note_url(note, format: :json)
