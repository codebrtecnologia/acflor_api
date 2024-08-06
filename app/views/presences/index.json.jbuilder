json.presences @presences do |presence|
  json.id presence.id
  json.presence presence.presence
  json.justification presence.justification
  json.classe_id presence.classe.name
  json.student_id presence.student.id
  json.team_id presence.team.code
end