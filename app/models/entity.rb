class Entity < ApplicationRecord
    has_many :entity_addresses
    include Filterable
    acts_as_paranoid

    validates :name, :responsible, :telephone, :email, presence: true
end
