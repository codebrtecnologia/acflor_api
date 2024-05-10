class EventBody < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  belongs_to :event
  belongs_to :public_body
end
