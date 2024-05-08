class Person < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  belongs_to :category, optional: true
  belongs_to :public_body, optional: true

  #VALIDATIONS
  validates :name, :email, presence: true
  validates :active, inclusion: { in: [true, false] }

  #SCOPES
  scope :filter_by_name, -> (name) {
    where("name ILIKE ?", "%#{name}%")
  }

  scope :filter_by_email, -> (email) {
    where("email ILIKE ?", "%#{email}%")
  }

  scope :filter_by_position, -> (position) {
    where("position ILIKE ?", "%#{position}%")
  }

  scope :filter_by_public_body_id, -> (public_body_id) {
    where("public_body_id" => public_body_id)
  }

  scope :filter_by_category_id, -> (category_id) {
    where("category_id" => category_id)
  }
end
