json.entity_courses @entity_courses do |entity_course|
  json.id entity_course.id
  json.entity_id entity_course.entity.name
  json.course_id entity_course.course.name
end
