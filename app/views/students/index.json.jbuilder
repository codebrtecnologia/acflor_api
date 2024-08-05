json.students @students do |student|
  json.id student.id
  json.course_id student.course_preference_1.name
  json.course_id student.course_preference_2.name
  json.user_id student.user.email
end
