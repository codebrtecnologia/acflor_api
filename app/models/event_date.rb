class EventDate < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  belongs_to :event

  # Validations
  validates :date, :start_time, :end_time, presence: true
end
