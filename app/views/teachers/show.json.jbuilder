json.teacher do
  json.id @teacher.id
  json.area_of_expertise @teacher.area_of_expertise
  json.teaching_experience @teacher.teaching_experience
  json.professional_experience @teacher.professional_experience
  json.cnpj_mei @teacher.cnpj_mei
  json.deficiency_id @teacher.deficiency.name
  json.user_id @teacher.user.email
end