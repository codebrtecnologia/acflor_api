class EmailHistory < ApplicationRecord
  belongs_to :attendance
  belongs_to :user
end