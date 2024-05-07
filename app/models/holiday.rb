class Holiday < ApplicationRecord
  acts_as_paranoid

  #VALIDATIONS
  validates :description, :date, :holiday_type, presence: true

  #ENUMS
  enum holiday_type: {
    municipal_holiday: 1,
    state_holiday: 2,
    federal_holiday: 3
  }, _prefix: :type

  #SCOPES
  scope :filter_by_description, -> (description) {
    where("description ILIKE ?", "%#{description}%")
  }

  scope :filter_by_initial_date, -> (initial_date) {
    where("date >= ?", initial_date)
  }

  scope :filter_by_final_date, -> (final_date) {
    where("date <= ?", final_date)
  }

  scope :filter_by_initial_and_final_date, -> (initial_date, final_date) {
    if initial_date && final_date
      where("date >= ? AND date <= ?", initial_date, final_date)
    end
  }

  scope :filter_by_holiday_type, -> (holiday_type) {
    where("holiday_type" => holiday_type)
  }

end
