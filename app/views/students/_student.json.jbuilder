json.extract! student, :id, :last_name, :first_name, :class_group_id, :created_at, :updated_at
json.url student_url(student, format: :json)
