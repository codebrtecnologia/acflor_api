class Deficiency < ApplicationRecord
    include Filterable
    acts_as_paranoid
    
    validates :name, presence: true
end
