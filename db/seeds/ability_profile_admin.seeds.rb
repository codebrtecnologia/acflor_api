puts 'Adding Permissions To Admin Profile >>>'

profile_name = 'Admin'
ability_profile = AbilityProfile.find_or_create_by(name: profile_name)
ability_actions = AbilityAction.all
ability_actions.each do |ability_action|
  ability_profile_id = ability_profile.id
  ability_action_id = ability_action.id
  AbilityPermission.find_or_create_by(ability_profile_id: ability_profile_id, ability_action_id: ability_action_id)
end
