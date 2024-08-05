class Classe < ApplicationRecord
  belongs_to :team
  belongs_to :teacher
  include Filterable
  acts_as_paranoid

  validates :name, :date, :shift, :description, :start_time, :end_time, presence: true
end
