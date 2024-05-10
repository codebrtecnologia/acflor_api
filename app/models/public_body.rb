class PublicBody < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  has_many :people, dependent: :restrict_with_exception

  has_many :event_bodies
  has_many :events, through: :event_bodies

  #VALIDATIONS
  validates :name, presence: true

  #SCOPES
  scope :filter_by_name, -> (name) {
    where("name ILIKE ?", "%#{name}%")
  }
end
