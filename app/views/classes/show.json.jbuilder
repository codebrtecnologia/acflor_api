json.classe do
  json.id @classes.id
  json.name @classes.name
  json.date @classes.date
  json.shift @classes.shift
  json.description @classes.description
  json.start_time @classes.start_time
  json.end_time @classes.end_time
  json.team_id @classes.team.code
  json.teacher_id @classes.teacher.cnpj_mei
end
