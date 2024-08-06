json.team_student_diciplines @team_student_diciplines do |team_student_dicipline|
  json.id team_student_dicipline.id
  json.team_student_id team_student_dicipline.team_student.registration_number
  json.dicipline_id team_student_dicipline.dicipline.name
  json.dicipline_status_id team_student_dicipline.dicipline_status.name
  json.active team_student_dicipline.active
end