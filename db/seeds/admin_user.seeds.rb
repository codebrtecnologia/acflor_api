puts 'Admin User >>>'

require 'securerandom'

ability_profile = AbilityProfile.find_by(name: 'Admin')

name_admin = 'Admin'
email_admin = 'admin@admin.com'
password_admin = '12345678' if Rails.env == 'development'
password_admin = SecureRandom.alphanumeric(10) if Rails.env == 'production'

if !User.find_by(email: email_admin)
  if User.create(
    name: name_admin,
    email: email_admin,
    password: password_admin,
    password_confirmation: password_admin,
    ability_profile_id: ability_profile.id
  )
    puts '>>> Usuário ADMIN criado'
    puts '>>> E-mail: ' + email_admin
    puts '>>> Password: ' + password_admin
  else
    puts '>>> ERROR: Não foi possível criar usuário ADMIN!'
    puts '>>> E-mail: ' + email_admin
  end
else
  puts '>>> Usuário ADMIN JÁ EXISTE!'
  puts '>>> E-mail: ' + email_admin
end
