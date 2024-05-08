class Category < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  has_many :people, dependent: :restrict_with_exception

  #VALIDATIONS
  validates :name, presence: true

  #SCOPES
  scope :filter_by_name, -> (name) {
    where("name ILIKE ?", "%#{name}%")
  }
end
