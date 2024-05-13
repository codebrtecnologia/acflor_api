class Appointment < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #CONSTANT
  MSG_INVALID_ID = "ID informado não é válido"

  #RELATIONSHIPS
  belongs_to :user
  belongs_to :city
  belongs_to :person

  #VALIDATIONS
  validates :final_date, comparison: { greater_than: :initial_date, message: "deve ser maior que data inicial"}
  validates :initial_date, comparison: { less_than: :final_date, message: "deve ser menor que data final"}

  validates :person_id, presence: true, numericality: { only_integer: true }
  validate :validate_person_id

  validates :user_id, presence: true, numericality: { only_integer: true }
  validate :validate_user_id

  validates :city_id, presence: true, numericality: { only_integer: true }
  validate :validate_city_id

  validates :title, :local, :initial_date, :final_date, :situation, :repetition, presence: true

  #ENUMS
  enum situation: {
    scheduled: 1,
    accomplished: 2,
    canceled: 3
  }, _prefix: :situation

  enum repetition: {
    never: 1,
    everyday: 2,
    every_business_day: 3,
    every_week: 4,
    every_two_weeks: 5,
    every_month: 6,
    every_year: 7
  }, _prefix: :repetition

  #CUSTOM METHODS
  def validate_person_id
    errors.add(:person_id, MSG_INVALID_ID) unless Person.exists?(self.person_id)
  end

  def validate_user_id
    errors.add(:user_id, MSG_INVALID_ID) unless User.exists?(self.user_id)
  end

  def validate_city_id
    errors.add(:city_id, MSG_INVALID_ID) unless City.exists?(self.city_id)
  end

end
