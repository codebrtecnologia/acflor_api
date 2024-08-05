json.course_diciplines @course_diciplines do |course_dicipline|
  json.id course_dicipline.id
  json.course_id course_dicipline.course.name
  json.dicipline_id course_dicipline.dicipline.name
  json.active course_dicipline.active 
end