json.user_deficiency do
  json.id @user_deficiencies.id
  json.observations @user_deficiencies.observations
  json.user_id @user_deficiencies.user.email
  json.deficiency_id @user_deficiencies.deficiency.name
end
