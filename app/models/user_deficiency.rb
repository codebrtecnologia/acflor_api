class UserDeficiency < ApplicationRecord
  belongs_to :user
  belongs_to :deficiency

  include Filterable
  acts_as_paranoid

  validates :observations, presence: true
end
