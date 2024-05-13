class City < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  has_many :events, dependent: :restrict_with_exception
  has_many :agenda_requests, dependent: :restrict_with_exception
  has_many :appointments, dependent: :restrict_with_exception

  #VALIDATIONS
  validates :name, presence: true
  validates_associated :appointments

  #SCOPES
  scope :filter_by_name, -> (name) {
    where("name ILIKE ?", "%#{name}%")
  }
end
