puts 'Admin User >>>'

require 'securerandom'

ability_profile = AbilityProfile.find_by(name: 'Admin')

name_admin = 'Admin'
email_admin = 'admin@admin.com'
password_admin = '12345678' if Rails.env == 'development'
password_admin = SecureRandom.alphanumeric(10) if Rails.env == 'production'

name_admin_teste2 = 'Admin Teste 2'
email_admin_teste2 = 'admin_teste_2@admin.com'

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

"----------------------------------------------------------------------------"

puts 'Admin User 2>>>'

if !User.find_by(email: email_admin_teste2)
  if User.create(
    name: name_admin_teste2,
    email: email_admin_teste2,
    password: password_admin,
    password_confirmation: password_admin,
    ability_profile_id: ability_profile.id
  )
    puts '>>> Usuário ADMIN TESTE 2 criado'
    puts '>>> E-mail: ' + email_admin_teste2
    puts '>>> Password: ' + password_admin
  else
    puts '>>> ERROR: Não foi possível criar usuário ADMIN TESTE 2!'
    puts '>>> E-mail: ' + email_admin_teste2
  end
else
  puts '>>> Usuário ADMIN TESTE 2 JÁ EXISTE!'
  puts '>>> E-mail: ' + email_admin
end
