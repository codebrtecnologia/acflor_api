json.entity_course do
  json.id @entity_courses.id
  json.entity_id @entity_courses.entity.name
  json.course_id @entity_courses.course.name
end
