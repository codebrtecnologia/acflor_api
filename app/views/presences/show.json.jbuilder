json.presence do
  json.id @presences.id
  json.presence @presences.presence
  json.justification @presences.justification
  json.classe_id @presences.classe.name
  json.student_id @presences.student.id
  json.team_id @presences.team.code
end
