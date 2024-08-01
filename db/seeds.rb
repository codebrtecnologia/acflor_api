puts " >>> RODANDO EM AMBIENTE: #{Rails.env.camelize}"
puts '- - - - - - - - - - '

load 'db/seeds/ability_resources.seeds.rb'
load 'db/seeds/ability_actions.seeds.rb'

load 'db/seeds/ability_profile_admin.seeds.rb'
load 'db/seeds/ability_profile_user.seeds.rb'

load 'db/seeds/admin_user.seeds.rb'

# load 'db/seeds/cities.seeds.rb'
