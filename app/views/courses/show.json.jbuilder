json.id @course.id
json.name  @course.name
json.company @course.company
json.created_at @course.created_at
json.updated_at @course.updated_at

json.file_attachments @course.file_attachments.order(:position)

json.file_attachments_count @course.file_attachments_count

