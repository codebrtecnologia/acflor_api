json.student do
  json.id @students.id
  json.course_id @students.course_preference_1.name
  json.course_id @students.course_preference_2.name
  json.user_id @students.user.email
end
