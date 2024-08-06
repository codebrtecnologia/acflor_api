class TeamStudentDicipline < ApplicationRecord
  include Filterable
  acts_as_paranoid

  belongs_to :team_student
  belongs_to :dicipline
  belongs_to :dicipline_status

  validates :active, presence: true
end
