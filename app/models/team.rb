class Team < ApplicationRecord
  include Filterable
  acts_as_paranoid

  belongs_to :course
  belongs_to :teacher

  validates :code, :start, :closing, :active, presence: true

end
