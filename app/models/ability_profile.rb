class AbilityProfile < ApplicationRecord
  has_many :ability_permissions

  validates :name, presence: true
end
