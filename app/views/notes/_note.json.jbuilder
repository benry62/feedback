json.extract! note, :id, :text, :student_id, :archive, :created_at, :updated_at
json.url note_url(note, format: :json)
