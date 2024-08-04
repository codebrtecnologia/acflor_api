class Deficiency < ApplicationRecord
    has_many :teacher
    include Filterable
    acts_as_paranoid
    
    validates :name, presence: true
end
