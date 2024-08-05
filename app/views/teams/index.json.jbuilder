json.teams @teams do |team|
  json.id team.id
  json.code team.code
  json.start team.start
  json.closing team.closing
  json.active team.active
  json.course_id team.course.name
  json.teacher_id team.teacher.cnpj_mei
end