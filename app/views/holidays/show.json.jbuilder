json.holidays do
  json.id @holidays.id
  json.description @holidays.description
  json.date @holidays.date
  json.type @holidays.decorate.holiday_type_i18n
end