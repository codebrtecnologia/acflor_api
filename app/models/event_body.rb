class EventBody < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  belongs_to :event
  belongs_to :public_body

  #VALIDATIONS
  # validates :event_id, numericality: { only_integer: true }
  # validate_id :event_id
  #
  # validates :public_body_id, numericality: { only_integer: true }
  # validate_id :public_body_id

end
