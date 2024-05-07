class AbilityResource < ApplicationRecord
  has_many :ability_actions

  validates :name, presence: true
end
