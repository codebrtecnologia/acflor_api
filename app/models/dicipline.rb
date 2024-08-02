class Dicipline < ApplicationRecord
    acts_as_paranoid
    
    validates :name, :code, presence: true
end
