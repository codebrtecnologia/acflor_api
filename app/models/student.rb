class Student < ApplicationRecord
  include Filterable
  acts_as_paranoid
  
  belongs_to :course_preference_1, class_name: "Course"
  belongs_to :course_preference_2, class_name: "Course"
  belongs_to :user
end
