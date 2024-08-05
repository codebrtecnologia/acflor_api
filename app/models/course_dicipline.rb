class CourseDicipline < ApplicationRecord
  include Filterable
  acts_as_paranoid

  belongs_to :course
  belongs_to :dicipline

  validates :active, presence: true
end
