class Attendance < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  belongs_to :event
  belongs_to :person

  #VALIDATIONS
  validates :confirmed_presence, inclusion: { in: [true, false] }

  # validates :event_id, presence: true, numericality: { only_integer: true }
  # validate_id :event_id
  #
  # validates :person_id, presence: true, numericality: { only_integer: true }
  # validate_id :person_id

end
