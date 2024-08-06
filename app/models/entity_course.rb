class EntityCourse < ApplicationRecord
  include Filterable
  acts_as_paranoid
  
  belongs_to :entity
  belongs_to :course
end
