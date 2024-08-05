json.team_student do
  json.id @team_students.id
  json.student_id @team_students.student.id
  json.team_id @team_students.team.id
  json.registration_number @team_students.registration_number
end
