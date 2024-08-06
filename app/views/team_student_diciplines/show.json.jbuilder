json.team_student_dicipline do

  json.id @team_student_diciplines.id
  json.team_student_id @team_student_diciplines.team_student.registration_number
  json.dicipline_id @team_student_diciplines.dicipline.name
  json.dicipline_status_id @team_student_diciplines.dicipline_status.name
  json.active @team_student_diciplines.active
end