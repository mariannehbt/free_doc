class Specialty < ApplicationRecord
  has_many :doctor, through: :join_table_doctor_specialty
end
