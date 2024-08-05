class UserAddress < ApplicationRecord
  belongs_to :user
  
  include Filterable
  acts_as_paranoid

  validates :street, :neighborhood, :city, :zip_code, presence: true
end
