class AbilityAction < ApplicationRecord
  belongs_to :ability_resource, optional: false

  validates :ability_resource_id, presence: true
  validates :name, presence: true

  scope :by_ability_resource, lambda { |resource_name|
    joins(:ability_resource).where('ability_resources.name = ?', resource_name)
  }
end
