class Presence < ApplicationRecord
  include Filterable
  acts_as_paranoid

  belongs_to :classe
  belongs_to :student
  belongs_to :team

#  validates :presence, :justification, presence: true
end
