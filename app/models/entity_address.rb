class EntityAddress < ApplicationRecord
  belongs_to :entity
  include Filterable
  acts_as_paranoid

  validates :street, :neighborhood, :city, :zip_code, presence: true
end
