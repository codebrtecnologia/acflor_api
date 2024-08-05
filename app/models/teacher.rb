class Teacher < ApplicationRecord
  include Filterable
  acts_as_paranoid

  belongs_to :deficiency
  belongs_to :user

  validates :area_of_expertise, :teaching_experience, :professional_experience, :cnpj_mei, presence: true

end
