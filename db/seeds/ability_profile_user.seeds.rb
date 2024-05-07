puts 'Adding Permissions To User Default Profile >>>'

profile_name = 'Usuário Comum'
ability_profile = AbilityProfile.find_or_create_by(name: profile_name)
ability_actions = AbilityAction
                  .joins(:ability_resource)
                  .where("ability_resources.name NOT IN ('ability_actions', 'ability_permissions',
                        'ability_profiles', 'ability_resources', 'users', 'certificates',
                        'exam_answers', 'inscriptions', 'job_opening_views',
                        'lesson_document_views', 'lesson_views', 'module_document_views',
                        'newsletter_views', 'people', 'person_documents', 'presences',
                        'useful_link_views')")
                  .where("ability_actions.name IN ('index','show','list_names')")
ability_actions.each do |ability_action|
  ability_profile_id = ability_profile.id
  ability_action_id = ability_action.id
  AbilityPermission.find_or_create_by(ability_profile_id:, ability_action_id:)
end

# Customized Permissions

ability_resource = AbilityResource.find_by(name: 'people')
ability_actions = AbilityAction
                  .where(ability_resource:)
                  .where("ability_actions.name IN ('getmyprofile','setmyprofile','myphoto')")
ability_actions.each do |ability_action|
  ability_profile_id = ability_profile.id
  ability_action_id = ability_action.id
  AbilityPermission.find_or_create_by(ability_profile_id:, ability_action_id:)
end

ability_resources = AbilityResource
                    .where("ability_resources.name IN ('job_opening_views','lesson_document_views',
                          'lesson_views','module_document_views','newsletter_views','useful_link_views')")
ability_resources.each do |ability_resource|
  ability_actions = AbilityAction
                    .where(ability_resource:)
                    .where("ability_actions.name IN ('getmyviews','setmyview')")
  ability_actions.each do |ability_action|
    ability_profile_id = ability_profile.id
    ability_action_id = ability_action.id
    AbilityPermission.find_or_create_by(ability_profile_id:, ability_action_id:)
  end
end
