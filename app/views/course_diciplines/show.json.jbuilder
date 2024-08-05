json.course_dicipline do
  json.id @course_diciplines.id
  json.course_id @course_diciplines.course.name
  json.dicipline_id @course_diciplines.dicipline.name
end
