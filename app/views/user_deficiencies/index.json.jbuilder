json.user_deficiencies @user_deficiencies do |user_deficiency|
  json.id user_deficiency.id
  json.observations user_deficiency.observations
  json.user_id user_deficiency.user.email
  json.deficiency_id user_deficiency.deficiency.name
end
