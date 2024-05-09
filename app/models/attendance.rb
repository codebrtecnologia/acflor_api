class Attendance < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  belongs_to :event
  belongs_to :person

  #VALIDATIONS
  validates :confirmed_presence, inclusion: { in: [true, false] }
end
