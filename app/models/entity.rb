class Entity < ApplicationRecord
    include Filterable
    acts_as_paranoid
    
    validates :name, :responsible, :telephone, :email, presence: true
end
