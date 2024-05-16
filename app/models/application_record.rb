class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  include Filterable
  include IdValidation
end
