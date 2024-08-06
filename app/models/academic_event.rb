class AcademicEvent < ApplicationRecord
    include Filterable
    acts_as_paranoid

    validates :name, :description, :start_date, :end_date, :start_time, :end_time, :local, presence: true
end
