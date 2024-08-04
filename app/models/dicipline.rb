class Dicipline < ApplicationRecord
    include Filterable
    acts_as_paranoid
    
    validates :name, :code, presence: true
end
