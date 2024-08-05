class TeamStudent < ApplicationRecord
  include Filterable
  acts_as_paranoid

  belongs_to :student
  belongs_to :team

  validates :registration_number, presence: true
end
