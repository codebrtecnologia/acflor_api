class AbilityPermission < ApplicationRecord
  belongs_to :ability_profile, optional: false
  belongs_to :ability_action, optional: false

  validates :ability_profile_id, presence: true
  validates :ability_action_id, presence: true
end
