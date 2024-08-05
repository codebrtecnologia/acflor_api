json.classes @classes do |classe|
  json.id classe.id
  json.name classe.name
  json.date classe.date
  json.shift classe.shift
  json.description classe.description
  json.start_time classe.start_time
  json.end_time classe.end_time
  json.team_id classe.team.code
  json.teacher_id classe.teacher.cnpj_mei
end
