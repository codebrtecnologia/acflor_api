json.team_students @team_students do |team_student|
  json.id team_student.id
  json.student_id team_student.student.id
  json.team_id team_student.team.id
  json.registration_number team_student.registration_number 
end
