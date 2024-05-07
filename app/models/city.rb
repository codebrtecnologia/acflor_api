class City < ApplicationRecord
  acts_as_paranoid

  #VALIDATIONS
  validates :name, presence: true

  #SCOPES
  scope :filter_by_name, -> (name) {
    where("name ILIKE ?", "%#{name}%")
  }
end
